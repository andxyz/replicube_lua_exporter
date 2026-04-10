use super::Args;
use crate::puzzle_parser;
use anyhow::{Context, Result};
use std::fs;

pub(crate) fn process_and_create_files(
    args: Args,
    parsed_progress_data: puzzle_parser::PuzzlesData,
) -> Result<(), anyhow::Error> {
    Ok(for puzzle in &parsed_progress_data.puzzles {
        if (puzzle.source - 100.0).abs() > f64::EPSILON {
            continue;
        }

        println!("#############");
        println!("{}:", puzzle.id);
        println!("#############");

        let looked_up_dirname = match puzzle_parser::PROPER_DIRNAME_LOOKUP.get(puzzle.id.as_str()) {
            Some(name) => name,
            None => {
                println!(
                    "Warning: puzzle ID {} not found in lookup table, skipping",
                    puzzle.id
                );
                continue;
            }
        };

        let clean_dirname = puzzle_parser::sanitize_dir_string(looked_up_dirname);
        let target_dir = args.outdir.join(clean_dirname);

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
    })
}
