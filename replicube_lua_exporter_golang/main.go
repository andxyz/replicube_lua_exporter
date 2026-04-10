package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"log"
	"os"
	"path/filepath"
)

func main() {
	var progressFilePath string
	var outputDir string

	flag.StringVar(&progressFilePath, "file", "", "Input progress.dat file path")
	flag.StringVar(&progressFilePath, "f", "", "Input progress.dat file path (shorthand)")
	flag.StringVar(&outputDir, "outdir", "", "Output directory for exported lua files and puzzles.json")
	flag.StringVar(&outputDir, "o", "", "Output directory for exported lua files and puzzles.json (shorthand)")

	flag.Parse()

	if progressFilePath == "" || outputDir == "" {
		flag.Usage()
		os.Exit(1)
	}

	// Validate input file path
	fileInfo, err := os.Stat(progressFilePath)
	if err != nil {
		log.Fatalf("Error accessing input file '%s': %v", progressFilePath, err)
	}
	if fileInfo.IsDir() {
		log.Fatalf("Error: input file '%s' is a directory", progressFilePath)
	}

	// Validate output directory path if it exists
	outDirInfo, err := os.Stat(outputDir)
	if err == nil {
		if !outDirInfo.IsDir() {
			log.Fatalf("Error: output path '%s' is a file, must be a directory", outputDir)
		}
	} else if !os.IsNotExist(err) {
		log.Fatalf("Error checking output directory '%s': %v", outputDir, err)
	}

	outputJSONPath := filepath.Join(outputDir, "puzzles.json")

	// Ensure output directory exists
	err = os.MkdirAll(outputDir, 0755)
	if err != nil {
		log.Fatalf("Error creating output directory '%s': %v", outputDir, err)
	}

	// Parse the progress.dat file for all the puzzles.
	puzzleData, err := ParseProgressFile(progressFilePath)
	if err != nil {
		log.Fatalf("Error parsing progress file '%s': %v", progressFilePath, err)
	}

	// Marshal the parsed data into JSON with indentation for readability.
	jsonData, err := json.MarshalIndent(puzzleData, "", "  ")
	if err != nil {
		log.Fatalf("Error marshalling data to JSON: %v", err)
	}

	err = ParsePuzzleJSONCreateDirsAndLuaFiles(jsonData, outputDir)
	if err != nil {
		log.Fatalf("Error exporting directory contents: %v", err)
	}

	err = os.WriteFile(outputJSONPath, jsonData, 0644)
	if err != nil {
		log.Fatalf("Error writing JSON to file '%s': %v", outputJSONPath, err)
	}

	successMessage := "Successfully exported puzzle data"
	fmt.Println(successMessage)
}
