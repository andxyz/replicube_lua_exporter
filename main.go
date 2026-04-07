package main

import (
	"encoding/json"
	"fmt"
	"log"
	"os"
	"path/filepath"

	"github.com/alecthomas/kong"
)

var CLI struct {
	File   string `help:"Input progress.dat file path" name:"file" required:"" type:"path" short:"f"`
	OutDir string `help:"Output directory for exported lua files and puzzles.json" name:"outdir" required:"" type:"path" short:"o"`
}

func main() {
	kong.Parse(&CLI)

	// Define input and output file paths
	progressFilePath := CLI.File
	outputDir := CLI.OutDir
	outputJSONPath := filepath.Join(outputDir, "puzzles.json")

	// Ensure output directory exists
	err := os.MkdirAll(outputDir, 0755)
	if err != nil {
		log.Fatalf("Error creating output directory '%s': %v", outputDir, err)
	}

	// Parse the progress.dat file for all the puzzles.
	data, err := ParseProgressFile(progressFilePath)
	if err != nil {
		log.Fatalf("Error parsing progress file '%s': %v", progressFilePath, err)
	}

	// Marshal the parsed data into JSON with indentation for readability.
	jsonData, err := json.MarshalIndent(data, "", "  ")
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

	successMessage := "Successfully exported puzzle data to " + outputJSONPath
	fmt.Println(successMessage)
}
