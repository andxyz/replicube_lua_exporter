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

#[cfg(test)]
mod tests {
    use super::*;
    use crate::mod_save_file_parser::Puzzle;
    use std::collections::HashMap;

    #[test]
    fn test_create_local_json_file() {
        let temp_dir = tempfile::tempdir().unwrap();
        let outdir = temp_dir.path().to_path_buf();

        let mut code_variants = HashMap::new();
        code_variants.insert("code".to_string(), "return 7".to_string());

        let puzzle = Puzzle {
            active_variant: "code".to_string(),
            animated: false,
            challenge_complete: false,
            code_instructions: 3.0,
            code_size: 2,
            code_variants,
            completed: true,
            fps: 12,
            frames: 1,
            id: "hello.txt".to_string(),
            size: 3,
            source: 100,
            variant_order: vec!["code".to_string()],
        };

        let parsed_progress_data = PuzzlesData {
            puzzles: vec![puzzle],
        };

        let res = create_local_json_file(&outdir, &parsed_progress_data);
        assert!(res.is_ok());

        let json_path = outdir.join("puzzles.json");
        assert!(json_path.exists());

        let file_content = fs::read_to_string(json_path).unwrap();
        let deserialized: PuzzlesData = serde_json::from_str(&file_content).unwrap();
        assert_eq!(deserialized.puzzles.len(), 1);
        assert_eq!(deserialized.puzzles[0].id, "hello.txt");
        assert_eq!(deserialized.puzzles[0].code_variants.get("code").unwrap(), "return 7");
    }
}
