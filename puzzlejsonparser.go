package main

import (
	"encoding/json"
	"fmt"
	"os"
	"regexp"
	"strings"
)

var properDirnameLookup = map[string]string{
	"3do.txt":                   "058 First-gen 3D game console",
	"8ball.txt":                 "046 8-Ball",
	"angle-stack.txt":           "Angle Stack",
	"angled_rainbow.txt":        "017 Angled Rainbow",
	"axis_frame.txt":            "Axis Frame",
	"baseball_bat.txt":          "041 Baseball Bat",
	"basic_cup.txt":             "009 Basic Cup",
	"basic_hourglass.txt":       "020 Basic Hourglass",
	"basketball.txt":            "042 Basketball Ball",
	"basketball_hoop.txt":       "044 Basketball Hoop",
	"bed.txt":                   "061 Bed",
	"biplane.txt":               "063 Biplane",
	"bouncing_ball.txt":         "Bouncing Ball",
	"bowling.txt":               "045 Bowling",
	"brick.txt":                 "029 Brick Wall",
	"burger.txt":                "068 Burger",
	"camera.txt":                "037 Camera",
	"chair.txt":                 "023 Little Chair",
	"change-the-operators.txt":  "003 In Comparison",
	"checkerboard.txt":          "016 Checkerboard",
	"clock.txt":                 "Analog Clock",
	"colorful-grid.txt":         "007 Importance of END",
	"cookie.txt":                "067 Cookie",
	"corner-intersect.txt":      "Corner Intersect",
	"creamsicle.txt":            "034 Orange Creamsicle",
	"cute_building.txt":         "035 Building",
	"cute_computer.txt":         "031 Cute Computer",
	"d6.txt":                    "057 Roll a D6",
	"doggo.txt":                 "025 Doggo",
	"dolphin.txt":               "Dolphin",
	"donut.txt":                 "069 Donut",
	"empty-space.txt":           "004 Explicit Nothingness",
	"fancy_hourglass.txt":       "026 Fancy Hourglass",
	"ferris-wheel.txt":          "Ferris Wheel",
	"first_condition.txt":       "002 Conditions May Apply",
	"football.txt":              "039 Football",
	"fractal-castle.txt":        "Fractal Castle (Cantor)",
	"framework.txt":             "Framework",
	"full_diagonal.txt":         "014 Big X",
	"gameboy.txt":               "038 Nostalgic Handheld Game",
	"green_planet.txt":          "066 Green Planet",
	"groucho.txt":               "060 Clever Disguise",
	"guitar.txt":                "049 Guitar",
	"headphones.txt":            "050 Headphones",
	"hello.txt":                 "001 The Very Basics",
	"hello_modulo.txt":          "015 Hello, Modulo",
	"impossible_tower.txt":      "059 Improbable Tower",
	"island.txt":                "Island",
	"keyboard.txt":              "048 Synthesizer",
	"menger_sponge.txt":         "Menger Sponge",
	"mini-duck.txt":             "021 Tiny Duck",
	"mini_dna.txt":              "Mini DNA",
	"mini_truck.txt":            "052 Mini Truck",
	"nested_frames.txt":         "Nested Frames",
	"nested_if.txt":             "010 Quadrants",
	"no_sign.txt":               "065 NO",
	"not_flower.txt":            "027 Not a Flower :)",
	"octo-gem.txt":              "Octo-Gem",
	"octopus.txt":               "053 Octopus",
	"outlet.txt":                "056 Power Outlet",
	"penguin_i_guess.txt":       "032 Penguin?",
	"pool-table.txt":            "047 Billiards Table",
	"puzzle_cube.txt":           "030 Puzzle Cube",
	"reverse-stairs.txt":        "022 Stairwell",
	"roadtrip.txt":              "Road Trip!",
	"roman_temple.txt":          "Roman Temple",
	"school-desk.txt":           "064 School Desk",
	"seven_seg.txt":             "7-Segment Display",
	"simple-sushi.txt":          "008 Simple Sushi",
	"simple_diagonal.txt":       "013 Diagonal Line",
	"simple_quadrant.txt":       "005 Simple Quadrant",
	"simple_stairs.txt":         "012 Staircase",
	"simple_table.txt":          "018 Wooden Table",
	"sofa.txt":                  "062 Sofa",
	"spiral.txt":                "Spiral",
	"stairs-bounce.txt":         "Bouncing Down",
	"strawberry.txt":            "024 Strawberry",
	"strawberry_cake_slice.txt": "019 Strawberry Cake Slice",
	"t-square.txt":              "T-Square",
	"taco.txt":                  "036 Taco",
	"tennis_ball.txt":           "040 Tennis Ball",
	"tennis_raquet.txt":         "043 Tennis Racquet",
	"tic-tac-toe-board.txt":     "006 3x3 Grid",
	"tic-tac-toe-game.txt":      "033 Tic-Tac-Toe",
	"tiled_room.txt":            "028 Tiled Room",
	"toaster.txt":               "Toaster",
	"traffic_light.txt":         "Traffic Light",
	"treadmill.txt":             "Treadmill",
	"tri-pyramid.txt":           "Tri-Pyramid",
	"triple-spiral.txt":         "Triple Spiral",
	"tv_color_bars.txt":         "CRT TV (No Signal)",
	"u-pipe.txt":                "070 U Pipe",
	"vicsek.txt":                "Vicsek Snowflake",
	"waterfall.txt":             "Waterfall",
	"watermelon.txt":            "070 Watermelon",
	"wide_tank.txt":             "055 Toy Tank",
	"winter-hat.txt":            "054 Winter Hat",
	"x-wall.txt":                "011 Variable Outcomes",
	"xylophone.txt":             "051 Xylophone",
	"xyz-lattice.txt":           "XYZ Lattice",
}

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

		lookedUpDirname, ok := properDirnameLookup[puzzle.ID]
		if !ok {
			fmt.Printf("Warning: puzzle ID %s not found in lookup table, skipping\n", puzzle.ID)
			continue
		}

		cleanDirname := sanitizeDirString(lookedUpDirname)
		targetDir := cleanDirname
		if outputDir != "" {
			targetDir = fmt.Sprintf("%s/%s", outputDir, cleanDirname)
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

			filePath := fmt.Sprintf("%s/%s", targetDir, filename)
			err := os.WriteFile(filePath, []byte(code), 0644)
			if err != nil {
				return fmt.Errorf("error writing file %s: %w", filePath, err)
			}
		}
		fmt.Println("\nALLDONE")
	}

	return nil
}
