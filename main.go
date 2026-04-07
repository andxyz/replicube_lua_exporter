package main

import (
	"encoding/json"
	"fmt"
	"log"
	"os"
)

// Note: The Puzzle and PuzzlesData structs are now defined in godotdatparser.go.
// If godotdatparser.go is in a different package, you would import it like:
// import godotdatparser "path/to/your/package"
// For this context, assuming both files are in the 'main' package and accessible.

func main() {
	// Define input and output file paths
	progressFilePath := "/home/andxyz/code/personal/replicube_lab/progress.dat"
	outputJSONPath := "/home/andxyz/code/personal/replicube_lab/puzzles.json"

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
