package main

import (
	"encoding/json"
	"fmt"
	"log"
	"os"

	"gopkg.in/ini.v1" // Import the ini library
)

// Note: The Puzzle and PuzzlesData structs are now defined in godotdatparser.go.
// For this context, assuming both files are in the 'main' package and accessible.

func main() {
	// Define input and output file paths
	progressFilePath := "/home/andxyz/code/personal/replicube_lab/progress.dat"
	outputJSONPath := "/home/andxyz/code/personal/replicube_lab/puzzles.json"

	// --- Temporary code to inspect progress.dat structure ---
	cfg, err := ini.Load(progressFilePath)
	if err != nil {
		log.Fatalf("Error loading progress file '%s': %v", progressFilePath, err)
	}

	fmt.Println("--- Sections and Keys in progress.dat ---")
	for _, section := range cfg.Sections() {
		fmt.Printf("[%s]", section.Name())
		for _, key := range section.Keys() {
			fmt.Printf("  %s = %s", key.Name(), key.String())
		}
		fmt.Println()
	}
	fmt.Println("-----------------------------------------")
	// --- End of temporary inspection code ---

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

	err = os.WriteFile(outputJSONPath, jsonData, 0644)
	if err != nil {
		log.Fatalf("Error writing JSON to file '%s': %v", outputJSONPath, err)
	}

	successMessage := "Successfully exported puzzle data to " + outputJSONPath
	fmt.Print(successMessage)
}
