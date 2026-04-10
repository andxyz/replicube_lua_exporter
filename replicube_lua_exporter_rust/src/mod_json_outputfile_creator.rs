use crate::mod_save_file_parser::PuzzlesData;
use anyhow::{Context, Result};
use std::fs;
use std::path::PathBuf;

pub(crate) fn create_local_json_file(
    outdir: &PathBuf,
    parsed_progress_data: &PuzzlesData,
) -> Result<(), anyhow::Error> {
    let json_data = serde_json::to_string_pretty(parsed_progress_data)
        .with_context(|| "Error marshalling data to JSON")?;
    let output_json_path = outdir.join("puzzles.json");
    fs::write(&output_json_path, &json_data)
        .with_context(|| format!("Error writing JSON to file '{:?}'", output_json_path))?;
    Ok(())
}
