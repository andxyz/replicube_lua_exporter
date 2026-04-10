use anyhow::{Context, Result, anyhow};
use clap::Parser;
use std::fs;
use std::path::PathBuf;

mod mod_json_outputfile_creator;
mod mod_puzzledata_processor;
mod mod_save_file_parser;

#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    #[arg(short, long, help = "Input progress.dat file path")]
    file: PathBuf,

    #[arg(
        short,
        long,
        help = "Output directory for exported lua files and puzzles.json"
    )]
    outdir: PathBuf,
}

fn main() -> Result<()> {
    let args = Args::parse();

    // Attempt some basic validation of the input file and output directory
    if !args.file.exists() {
        return Err(anyhow!("Input file '{:?}' does not exist", args.file));
    }

    if args.file.is_dir() {
        return Err(anyhow!("Input file '{:?}' is a directory", args.file));
    }

    if args.outdir.exists() && !args.outdir.is_dir() {
        return Err(anyhow!(
            "Output path '{:?}' is a file, must be a directory",
            args.outdir
        ));
    }

    fs::create_dir_all(&args.outdir)
        .with_context(|| format!("Error creating output directory '{:?}'", args.outdir))?;

    // Parse the progress file
    let parsed_progress_data = mod_save_file_parser::parse_progress_file(&args.file)?;
    // Create the local JSON file
    mod_json_outputfile_creator::create_local_json_file(&args.outdir, &parsed_progress_data)?;
    // Create the local dirs and lua files
    mod_puzzledata_processor::process_and_create_files(args.outdir, parsed_progress_data)?;

    println!("Successfully exported puzzle data");
    Ok(())
}
