package main

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"regexp"
	"strings"
)

func sanitizeDirString(dirName string) string {
	dirName = strings.ReplaceAll(dirName, " ", "_")
	reg := regexp.MustCompile(`[^0-9A-Za-z_]`)
	dirName = reg.ReplaceAllString(dirName, "")
	reg2 := regexp.MustCompile(`_+$`)
	dirName = reg2.ReplaceAllString(dirName, "")
	return dirName
}

func ParsePuzzleJSONCreateDirsAndLuaFiles(jsonData []byte, outputDir string) error {
	var puzzlesData PuzzlesData
	err := json.Unmarshal(jsonData, &puzzlesData)
	if err != nil {
		return fmt.Errorf("error unmarshalling JSON: %w", err)
	}

	for _, puzzle := range puzzlesData.Puzzles {
		if puzzle.Source != 100 {
			continue
		}

		fmt.Println("#############")
		fmt.Printf("%s:\n", puzzle.ID)
		fmt.Println("#############")

		levelLookup, ok := properLevelNameLookup[puzzle.ID]
		if !ok {
			fmt.Printf("Warning: puzzle ID %s not found in lookup table, skipping\n", puzzle.ID)
			continue
		}
		cleanLevelDirname := sanitizeDirString(levelLookup.Dirname)
		cleanLevelName := sanitizeDirString(levelLookup.LevelName)
		targetDir := cleanLevelName
		if outputDir != "" {
			targetDir = filepath.Join(outputDir, cleanLevelDirname, cleanLevelName)
		}

		err := os.MkdirAll(targetDir, 0755)
		if err != nil {
			return fmt.Errorf("error creating directory %s: %w", targetDir, err)
		}

		for i, codeTabName := range puzzle.VariantOrder {
			filename := fmt.Sprintf("%02d_%s.lua", i, codeTabName)
			fmt.Printf("%s: \n", filename)
			code := puzzle.CodeVariants[codeTabName]
			fmt.Println(code)

			filePath := filepath.Join(targetDir, filename)
			err := os.WriteFile(filePath, []byte(code), 0644)
			if err != nil {
				return fmt.Errorf("error writing file %s: %w", filePath, err)
			}
		}
		fmt.Println()
	}

	return nil
}
