use crate::mod_save_file_parser;
use anyhow::{Context, Result};
use std::{fs, path::PathBuf};

const SOURCE_MAIN_STORY: i32 = 100;
const SOURCE_WEEKLY: i32 = 400;

pub(crate) fn process_and_create_files(
    outdir: &PathBuf,
    parsed_puzzle_data: &mod_save_file_parser::PuzzlesData,
) -> Result<(), anyhow::Error> {
    for puzzle in &parsed_puzzle_data.puzzles {
        if !is_main_story_puzzle(puzzle) && !is_weekly_puzzle(puzzle) {
            println!(
                "Warning: skipping puzzle ID: '{}', puzzle source: '{}'",
                puzzle.id, puzzle.source
            );
            continue;
        }

        log::info!("#############");
        log::info!("{}:", puzzle.id);
        log::info!("#############");

        let target_dir = if is_main_story_puzzle(puzzle) {
            match lookup_main_story_dirname(puzzle, outdir) {
                Some(dir) => dir,
                None => {
                    println!(
                        "Warning: puzzle ID {} not found in mainstory lookup table, skipping",
                        puzzle.id
                    );
                    continue;
                }
            }
        } else {
            lookup_weekly_dirname(puzzle, outdir)
        };

        fs::create_dir_all(&target_dir)
            .with_context(|| format!("Error creating directory {:?}", target_dir))?;

        for (i, code_tab_name) in puzzle.variant_order.iter().enumerate() {
            let filename = format!("{:02}_{}.lua", i, code_tab_name);
            log::info!("{}: ", filename);
            let code = puzzle
                .code_variants
                .get(code_tab_name)
                .map(|s| s.as_str())
                .unwrap_or("");
            log::info!("{}", code);

            let file_path = target_dir.join(filename);
            fs::write(&file_path, code)
                .with_context(|| format!("Error writing file {:?}", file_path))?;
        }
        log::info!("");
    }
    Ok(())
}

fn is_main_story_puzzle(puzzle: &mod_save_file_parser::Puzzle) -> bool {
    puzzle.source == SOURCE_MAIN_STORY
}

fn lookup_main_story_dirname(
    puzzle: &mod_save_file_parser::Puzzle,
    outdir: &PathBuf,
) -> Option<PathBuf> {
    let level_lookup = mod_save_file_parser::PROPER_DIRNAME_LOOKUP.get(puzzle.id.as_str())?;
    let clean_dirname = mod_save_file_parser::sanitize_dir_string(level_lookup.dirname);
    let clean_levelname = mod_save_file_parser::sanitize_dir_string(level_lookup.level_name);
    Some(outdir.join(clean_dirname).join(clean_levelname))
}

fn is_weekly_puzzle(puzzle: &mod_save_file_parser::Puzzle) -> bool {
    puzzle.source == SOURCE_WEEKLY
}

fn lookup_weekly_dirname(puzzle: &mod_save_file_parser::Puzzle, outdir: &PathBuf) -> PathBuf {
    let clean_weekly_dirname = mod_save_file_parser::sanitize_dir_string("__Weekly_Puzzles");
    let clean_puzzle_id = mod_save_file_parser::sanitize_dir_string(&puzzle.id);
    outdir.join(clean_weekly_dirname).join(clean_puzzle_id)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::mod_save_file_parser::{Puzzle, PuzzlesData};
    use std::collections::HashMap;

    fn create_dummy_puzzle(
        id: &str,
        source: i32,
        variant_order: Vec<String>,
        code_variants: HashMap<String, String>,
    ) -> Puzzle {
        Puzzle {
            active_variant: "".to_string(),
            animated: false,
            challenge_complete: false,
            code_instructions: 0.0,
            code_size: 0,
            code_variants,
            completed: false,
            fps: 0,
            frames: 0,
            id: id.to_string(),
            size: 0,
            source,
            variant_order,
        }
    }

    #[test]
    fn test_is_main_story_puzzle() {
        let p1 = create_dummy_puzzle("hello.txt", 100, vec![], HashMap::new());
        let p2 = create_dummy_puzzle("weekly.txt", 400, vec![], HashMap::new());
        assert!(is_main_story_puzzle(&p1));
        assert!(!is_main_story_puzzle(&p2));
    }

    #[test]
    fn test_is_weekly_puzzle() {
        let p1 = create_dummy_puzzle("hello.txt", 100, vec![], HashMap::new());
        let p2 = create_dummy_puzzle("weekly.txt", 400, vec![], HashMap::new());
        assert!(!is_weekly_puzzle(&p1));
        assert!(is_weekly_puzzle(&p2));
    }

    #[test]
    fn test_lookup_main_story_dirname() {
        let outdir = PathBuf::from("test_out");
        let p_valid = create_dummy_puzzle("hello.txt", 100, vec![], HashMap::new());
        let dir_valid = lookup_main_story_dirname(&p_valid, &outdir);
        assert!(dir_valid.is_some());
        assert_eq!(
            dir_valid.unwrap(),
            outdir.join("01_Tutorial").join("01__The_Very_Basics")
        );

        let p_invalid = create_dummy_puzzle("unknown.txt", 100, vec![], HashMap::new());
        let dir_invalid = lookup_main_story_dirname(&p_invalid, &outdir);
        assert!(dir_invalid.is_none());
    }

    #[test]
    fn test_lookup_weekly_dirname() {
        let outdir = PathBuf::from("test_out");
        let p = create_dummy_puzzle("week_12.txt", 400, vec![], HashMap::new());
        let dir = lookup_weekly_dirname(&p, &outdir);
        assert_eq!(dir, outdir.join("__Weekly_Puzzles").join("week_12_txt"));
    }

    #[test]
    fn test_process_and_create_files() {
        let temp_dir = tempfile::tempdir().unwrap();
        let outdir = temp_dir.path().to_path_buf();

        let mut code_variants_1 = HashMap::new();
        code_variants_1.insert("code".to_string(), "return 7".to_string());
        let p1 = create_dummy_puzzle("hello.txt", 100, vec!["code".to_string()], code_variants_1);

        let mut code_variants_2 = HashMap::new();
        code_variants_2.insert("code".to_string(), "return 1".to_string());
        code_variants_2.insert("code 2".to_string(), "return 2".to_string());
        let p2 = create_dummy_puzzle(
            "weekly_1",
            400,
            vec!["code".to_string(), "code 2".to_string()],
            code_variants_2,
        );

        let p3 = create_dummy_puzzle("skipped.txt", 500, vec![], HashMap::new());

        let data = PuzzlesData {
            puzzles: vec![p1, p2, p3],
        };

        let result = process_and_create_files(&outdir, &data);
        assert!(result.is_ok());

        let main_story_file = outdir
            .join("01_Tutorial")
            .join("01__The_Very_Basics")
            .join("00_code.lua");
        assert!(main_story_file.exists());
        assert_eq!(std::fs::read_to_string(&main_story_file).unwrap(), "return 7");

        let weekly_file_1 = outdir
            .join("__Weekly_Puzzles")
            .join("weekly_1")
            .join("00_code.lua");
        let weekly_file_2 = outdir
            .join("__Weekly_Puzzles")
            .join("weekly_1")
            .join("01_code 2.lua");
        assert!(weekly_file_1.exists());
        assert!(weekly_file_2.exists());
        assert_eq!(std::fs::read_to_string(&weekly_file_1).unwrap(), "return 1");
        assert_eq!(std::fs::read_to_string(&weekly_file_2).unwrap(), "return 2");

        let skipped_dir = outdir.join("__Weekly_Puzzles").join("skipped_txt");
        assert!(!skipped_dir.exists());
    }
}
