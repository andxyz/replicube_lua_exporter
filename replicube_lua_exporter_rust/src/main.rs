use anyhow::{Context, Result, anyhow};
use clap::Parser;
use once_cell::sync::Lazy;
use phf::phf_map;
use regex::Regex;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::fs;
use std::path::{Path, PathBuf};

#[derive(Debug, Serialize, Deserialize)]
pub struct Puzzle {
    pub active_variant: String,
    pub animated: bool,
    pub challenge_complete: bool,
    pub code_instructions: f64,
    pub code_size: f64,
    pub code_variants: HashMap<String, String>,
    pub completed: bool,
    pub fps: f64,
    pub frames: f64,
    pub id: String,
    pub size: f64,
    pub source: f64,
    pub variant_order: Vec<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct PuzzlesData {
    pub puzzles: Vec<Puzzle>,
}

static PROPER_DIRNAME_LOOKUP: phf::Map<&'static str, &'static str> = phf_map! {
    "3do.txt" => "058 First-gen 3D game console",
    "8ball.txt" => "046 8-Ball",
    "angle-stack.txt" => "Angle Stack",
    "angled_rainbow.txt" => "017 Angled Rainbow",
    "axis_frame.txt" => "Axis Frame",
    "baseball_bat.txt" => "041 Baseball Bat",
    "basic_cup.txt" => "009 Basic Cup",
    "basic_hourglass.txt" => "020 Basic Hourglass",
    "basketball.txt" => "042 Basketball Ball",
    "basketball_hoop.txt" => "044 Basketball Hoop",
    "bed.txt" => "061 Bed",
    "biplane.txt" => "063 Biplane",
    "bouncing_ball.txt" => "Bouncing Ball",
    "bowling.txt" => "045 Bowling",
    "brick.txt" => "029 Brick Wall",
    "burger.txt" => "068 Burger",
    "camera.txt" => "037 Camera",
    "chair.txt" => "023 Little Chair",
    "change-the-operators.txt" => "003 In Comparison",
    "checkerboard.txt" => "016 Checkerboard",
    "clock.txt" => "Analog Clock",
    "colorful-grid.txt" => "007 Importance of END",
    "cookie.txt" => "067 Cookie",
    "corner-intersect.txt" => "Corner Intersect",
    "creamsicle.txt" => "034 Orange Creamsicle",
    "cute_building.txt" => "035 Building",
    "cute_computer.txt" => "031 Cute Computer",
    "d6.txt" => "057 Roll a D6",
    "doggo.txt" => "025 Doggo",
    "dolphin.txt" => "Dolphin",
    "donut.txt" => "069 Donut",
    "empty-space.txt" => "004 Explicit Nothingness",
    "fancy_hourglass.txt" => "026 Fancy Hourglass",
    "ferris-wheel.txt" => "Ferris Wheel",
    "first_condition.txt" => "002 Conditions May Apply",
    "football.txt" => "039 Football",
    "fractal-castle.txt" => "Fractal Castle (Cantor)",
    "framework.txt" => "Framework",
    "full_diagonal.txt" => "014 Big X",
    "gameboy.txt" => "038 Nostalgic Handheld Game",
    "green_planet.txt" => "066 Green Planet",
    "groucho.txt" => "060 Clever Disguise",
    "guitar.txt" => "049 Guitar",
    "headphones.txt" => "050 Headphones",
    "hello.txt" => "001 The Very Basics",
    "hello_modulo.txt" => "015 Hello, Modulo",
    "impossible_tower.txt" => "059 Improbable Tower",
    "island.txt" => "Island",
    "keyboard.txt" => "048 Synthesizer",
    "menger_sponge.txt" => "Menger Sponge",
    "mini-duck.txt" => "021 Tiny Duck",
    "mini_dna.txt" => "Mini DNA",
    "mini_truck.txt" => "052 Mini Truck",
    "nested_frames.txt" => "Nested Frames",
    "nested_if.txt" => "010 Quadrants",
    "no_sign.txt" => "065 NO",
    "not_flower.txt" => "027 Not a Flower :)",
    "octo-gem.txt" => "Octo-Gem",
    "octopus.txt" => "053 Octopus",
    "outlet.txt" => "056 Power Outlet",
    "penguin_i_guess.txt" => "032 Penguin?",
    "pool-table.txt" => "047 Billiards Table",
    "puzzle_cube.txt" => "030 Puzzle Cube",
    "reverse-stairs.txt" => "022 Stairwell",
    "roadtrip.txt" => "Road Trip!",
    "roman_temple.txt" => "Roman Temple",
    "school-desk.txt" => "064 School Desk",
    "seven_seg.txt" => "7-Segment Display",
    "simple-sushi.txt" => "008 Simple Sushi",
    "simple_diagonal.txt" => "013 Diagonal Line",
    "simple_quadrant.txt" => "005 Simple Quadrant",
    "simple_stairs.txt" => "012 Staircase",
    "simple_table.txt" => "018 Wooden Table",
    "sofa.txt" => "062 Sofa",
    "spiral.txt" => "Spiral",
    "stairs-bounce.txt" => "Bouncing Down",
    "strawberry.txt" => "024 Strawberry",
    "strawberry_cake_slice.txt" => "019 Strawberry Cake Slice",
    "t-square.txt" => "T-Square",
    "taco.txt" => "036 Taco",
    "tennis_ball.txt" => "040 Tennis Ball",
    "tennis_raquet.txt" => "043 Tennis Racquet",
    "tic-tac-toe-board.txt" => "006 3x3 Grid",
    "tic-tac-toe-game.txt" => "033 Tic-Tac-Toe",
    "tiled_room.txt" => "028 Tiled Room",
    "toaster.txt" => "Toaster",
    "traffic_light.txt" => "Traffic Light",
    "treadmill.txt" => "Treadmill",
    "tri-pyramid.txt" => "Tri-Pyramid",
    "triple-spiral.txt" => "Triple Spiral",
    "tv_color_bars.txt" => "CRT TV (No Signal)",
    "u-pipe.txt" => "070 U Pipe",
    "vicsek.txt" => "Vicsek Snowflake",
    "waterfall.txt" => "Waterfall",
    "watermelon.txt" => "070 Watermelon",
    "wide_tank.txt" => "055 Toy Tank",
    "winter-hat.txt" => "054 Winter Hat",
    "x-wall.txt" => "011 Variable Outcomes",
    "xylophone.txt" => "051 Xylophone",
    "xyz-lattice.txt" => "XYZ Lattice",
};

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

struct DataParser<'a> {
    input: &'a str,
    pos: usize,
}

impl<'a> DataParser<'a> {
    fn new(input: &'a str) -> Self {
        Self { input, pos: 0 }
    }

    fn skip_whitespace(&mut self) {
        let bytes = self.input.as_bytes();
        while self.pos < bytes.len() {
            let c = bytes[self.pos];
            if c == b' ' || c == b'\t' || c == b'\n' || c == b'\r' {
                self.pos += 1;
            } else {
                break;
            }
        }
    }

    fn parse_value(&mut self) -> Result<serde_json::Value> {
        self.skip_whitespace();
        let bytes = self.input.as_bytes();
        if self.pos >= bytes.len() {
            return Err(anyhow!("unexpected end of input"));
        }

        let c = bytes[self.pos];
        match c {
            b'{' => self.parse_object(),
            b'[' => self.parse_array(),
            b'"' => self.parse_string().map(serde_json::Value::String),
            b't' | b'f' => self.parse_bool().map(serde_json::Value::Bool),
            _ => {
                if (c >= b'0' && c <= b'9') || c == b'-' || c == b'.' {
                    self.parse_number()
                } else {
                    Err(anyhow!(
                        "unexpected character '{}' at pos {}",
                        c as char,
                        self.pos
                    ))
                }
            }
        }
    }

    fn parse_string(&mut self) -> Result<String> {
        let bytes = self.input.as_bytes();
        if bytes[self.pos] != b'"' {
            return Err(anyhow!("expected '\"' at pos {}", self.pos));
        }
        self.pos += 1;
        let mut s = String::new();
        while self.pos < bytes.len() {
            let c = bytes[self.pos];
            if c == b'"' {
                self.pos += 1;
                return Ok(s);
            }
            if c == b'\\' {
                self.pos += 1;
                if self.pos >= bytes.len() {
                    return Err(anyhow!("unexpected end of input in string escape"));
                }
                let esc = bytes[self.pos];
                match esc {
                    b'"' => s.push('"'),
                    b'\\' => s.push('\\'),
                    b'n' => s.push('\n'),
                    b'r' => s.push('\r'),
                    b't' => s.push('\t'),
                    _ => {
                        s.push('\\');
                        s.push(esc as char);
                    }
                }
                self.pos += 1;
            } else {
                s.push(c as char);
                self.pos += 1;
            }
        }
        Err(anyhow!("unterminated string"))
    }

    fn parse_bool(&mut self) -> Result<bool> {
        if self.input[self.pos..].starts_with("true") {
            self.pos += 4;
            Ok(true)
        } else if self.input[self.pos..].starts_with("false") {
            self.pos += 5;
            Ok(false)
        } else {
            Err(anyhow!("expected boolean at pos {}", self.pos))
        }
    }

    fn parse_number(&mut self) -> Result<serde_json::Value> {
        let start = self.pos;
        let bytes = self.input.as_bytes();
        while self.pos < bytes.len() {
            let c = bytes[self.pos];
            if (c >= b'0' && c <= b'9')
                || c == b'-'
                || c == b'.'
                || c == b'e'
                || c == b'E'
                || c == b'+'
            {
                self.pos += 1;
            } else {
                break;
            }
        }
        let s = &self.input[start..self.pos];
        let n: f64 = s
            .parse()
            .with_context(|| format!("failed to parse number: {}", s))?;
        Ok(serde_json::Number::from_f64(n)
            .map(serde_json::Value::Number)
            .unwrap_or(serde_json::Value::Null))
    }

    fn parse_array(&mut self) -> Result<serde_json::Value> {
        let bytes = self.input.as_bytes();
        if bytes[self.pos] != b'[' {
            return Err(anyhow!("expected '[' at pos {}", self.pos));
        }
        self.pos += 1;
        let mut arr = Vec::new();
        loop {
            self.skip_whitespace();
            if self.pos < bytes.len() && bytes[self.pos] == b']' {
                self.pos += 1;
                return Ok(serde_json::Value::Array(arr));
            }
            let val = self.parse_value()?;
            arr.push(val);
            self.skip_whitespace();
            if self.pos < bytes.len() && bytes[self.pos] == b',' {
                self.pos += 1;
            }
        }
    }

    fn parse_object(&mut self) -> Result<serde_json::Value> {
        let bytes = self.input.as_bytes();
        if bytes[self.pos] != b'{' {
            return Err(anyhow!("expected '{{' at pos {}", self.pos));
        }
        self.pos += 1;
        let mut obj = serde_json::Map::new();
        loop {
            self.skip_whitespace();
            if self.pos < bytes.len() && bytes[self.pos] == b'}' {
                self.pos += 1;
                return Ok(serde_json::Value::Object(obj));
            }
            let key = self.parse_string()?;
            self.skip_whitespace();
            if self.pos >= bytes.len() || bytes[self.pos] != b':' {
                return Err(anyhow!(
                    "expected ':' after key '{}' at pos {}",
                    key,
                    self.pos
                ));
            }
            self.pos += 1;
            let val = self.parse_value()?;
            obj.insert(key, val);
            self.skip_whitespace();
            if self.pos < bytes.len() && bytes[self.pos] == b',' {
                self.pos += 1;
            }
        }
    }
}

fn sanitize_dir_string(dir_name: &str) -> String {
    static REG1: Lazy<Regex> = Lazy::new(|| Regex::new(r"[^0-9A-Za-z_]").unwrap());
    static REG2: Lazy<Regex> = Lazy::new(|| Regex::new(r"_+$").unwrap());

    let name = dir_name.replace(" ", "_");
    let name = REG1.replace_all(&name, "");
    let name = REG2.replace_all(&name, "");
    name.to_string()
}

fn parse_progress_file(file_path: &Path) -> Result<PuzzlesData> {
    let content = fs::read_to_string(file_path)
        .with_context(|| format!("Failed to read file: {:?}", file_path))?;

    let puzzles_section = content
        .find("[puzzles]")
        .ok_or_else(|| anyhow!("[puzzles] section not found"))?;
    let s = &content[puzzles_section..];

    let all_key = s
        .find("all=")
        .ok_or_else(|| anyhow!("all= key not found in [puzzles] section"))?;
    let json_start = all_key + 4;
    let json_str = &s[json_start..];

    let mut parser = DataParser::new(json_str);
    let json_result = parser.parse_array()?;

    let puzzles: Vec<Puzzle> = serde_json::from_value(json_result)
        .with_context(|| "Failed to convert parsed value to Puzzle vector")?;

    Ok(PuzzlesData { puzzles })
}

fn main() -> Result<()> {
    let args = Args::parse();

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

    let data = parse_progress_file(&args.file)?;

    let json_data =
        serde_json::to_string_pretty(&data).with_context(|| "Error marshalling data to JSON")?;

    let output_json_path = args.outdir.join("puzzles.json");
    fs::write(&output_json_path, &json_data)
        .with_context(|| format!("Error writing JSON to file '{:?}'", output_json_path))?;

    for puzzle in &data.puzzles {
        if (puzzle.source - 100.0).abs() > f64::EPSILON {
            continue;
        }

        println!("#############");
        println!("{}:", puzzle.id);
        println!("#############");

        let looked_up_dirname = match PROPER_DIRNAME_LOOKUP.get(puzzle.id.as_str()) {
            Some(name) => name,
            None => {
                println!(
                    "Warning: puzzle ID {} not found in lookup table, skipping",
                    puzzle.id
                );
                continue;
            }
        };

        let clean_dirname = sanitize_dir_string(looked_up_dirname);
        let target_dir = args.outdir.join(clean_dirname);

        fs::create_dir_all(&target_dir)
            .with_context(|| format!("Error creating directory {:?}", target_dir))?;

        for (i, code_tab_name) in puzzle.variant_order.iter().enumerate() {
            let filename = format!("{:02}_{}.lua", i, code_tab_name);
            println!("{}: ", filename);
            let code = puzzle
                .code_variants
                .get(code_tab_name)
                .map(|s| s.as_str())
                .unwrap_or("");
            println!("{}", code);

            let file_path = target_dir.join(filename);
            fs::write(&file_path, code)
                .with_context(|| format!("Error writing file {:?}", file_path))?;
        }
        println!();
    }

    println!("Successfully exported puzzle data");
    Ok(())
}
