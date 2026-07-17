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

        println!("#############");
        println!("{}:", puzzle.id);
        println!("#############");

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
            println!("{}: ", filename);
            let code = puzzle
                .code_variants
                .get(code_tab_name)
                .map(|s| s.as_str())
                .unwrap_or("");
            println!("{}", code);

            let file_path = target_dir.join(filename);
            fs::write(&file_path, code)
                .with_context(|| format!("Error writing file {:?}", file_path))?;
        }
        println!();
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
    let level_lookup =
        mod_save_file_parser::PROPER_DIRNAME_LOOKUP.get(puzzle.id.as_str())?;
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

