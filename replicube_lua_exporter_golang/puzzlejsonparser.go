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
	dirName = strings.ReplaceAll(dirName, ".", "_")
	reg := regexp.MustCompile(`[^0-9A-Za-z_]`)
	dirName = reg.ReplaceAllString(dirName, "")
	reg2 := regexp.MustCompile(`_+$`)
	dirName = reg2.ReplaceAllString(dirName, "")
	return dirName
}

func ParsePuzzleJSONCreateDirsAndLuaFiles(jsonData []byte, outputDir string) error {
	var puzzlesData PuzzlesData
	err := json.Unmarshal(jsonData, &puzzlesData)

	if outputDir == "" {
		return fmt.Errorf("output directory must be specified")
	}

	if err != nil {
		return fmt.Errorf("error unmarshalling JSON: %w", err)
	}

	for _, puzzle := range puzzlesData.Puzzles {
		if !isMainStoryPuzzle(puzzle) && !isWeeklyPuzzle(puzzle) {
			fmt.Printf("Warning: skipping puzzle ID: '%s', puzzle source: '%d'\n", puzzle.ID, puzzle.Source)
			continue
		}

		fmt.Println("#############")
		fmt.Printf("%s:\n", puzzle.ID)
		fmt.Println("#############")

		ok, targetDir := false, ""
		if isMainStoryPuzzle(puzzle) {
			ok, targetDir = lookupMainStoryDirname(puzzle, outputDir)
			if !ok {
				fmt.Printf("Warning: puzzle ID %s not found in mainstory lookup table, skipping\n", puzzle.ID)
				continue
			}
		} else if isWeeklyPuzzle(puzzle) {
			ok, targetDir = lookupWeeklyDirname(puzzle, outputDir)
			if !ok {
				fmt.Printf("Warning: skipping puzzle ID %s\n", puzzle.ID)
				continue
			}
		}

		err := os.MkdirAll(targetDir, 0755)
		if err != nil {
			return fmt.Errorf("error creating directory '%s': %w", targetDir, err)
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

func isMainStoryPuzzle(p Puzzle) bool {
	return p.Source == 100
}

func lookupMainStoryDirname(puzzle Puzzle, outputDir string) (bool, string) {
	levelLookup, ok := properLevelNameLookup[puzzle.ID]
	if !ok {
		return false, ""
	}

	cleanLevelDirname := sanitizeDirString(levelLookup.Dirname)
	cleanLevelName := sanitizeDirString(levelLookup.LevelName)
	targetDir := filepath.Join(outputDir, cleanLevelDirname, cleanLevelName)
	return ok, targetDir
}

func isWeeklyPuzzle(p Puzzle) bool {
	return p.Source == 400
}

func lookupWeeklyDirname(puzzle Puzzle, outputDir string) (bool, string) {
	cleanWeeklyDirname := sanitizeDirString("__Weekly_Puzzles")
	cleanPuzzleId := sanitizeDirString(puzzle.ID)
	targetDir := filepath.Join(outputDir, cleanWeeklyDirname, cleanPuzzleId)
	return true, targetDir
}
