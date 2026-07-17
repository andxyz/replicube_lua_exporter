use super::PathBuf;
use anyhow::{Context, Result, anyhow};
use phf::phf_map;
use regex::Regex;
use serde::{Deserialize, Deserializer, Serialize};
use std::collections::HashMap;
use std::fs;
use std::sync::LazyLock;

fn deserialize_null_default<'de, D, T>(deserializer: D) -> Result<T, D::Error>
where
    D: Deserializer<'de>,
    T: Default + Deserialize<'de>,
{
    let opt = Option::deserialize(deserializer)?;
    Ok(opt.unwrap_or_default())
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Puzzle {
    #[serde(default, deserialize_with = "deserialize_null_default")]
    pub active_variant: String,
    #[serde(default, deserialize_with = "deserialize_null_default")]
    pub animated: bool,
    #[serde(default, deserialize_with = "deserialize_null_default")]
    pub challenge_complete: bool,
    #[serde(default, deserialize_with = "deserialize_null_default")]
    pub code_instructions: f32,
    #[serde(default, deserialize_with = "deserialize_null_default")]
    pub code_size: i32,
    pub code_variants: HashMap<String, String>,
    #[serde(default, deserialize_with = "deserialize_null_default")]
    pub completed: bool,
    #[serde(default, deserialize_with = "deserialize_null_default")]
    pub fps: i32,
    #[serde(default, deserialize_with = "deserialize_null_default")]
    pub frames: i32,
    pub id: String,
    #[serde(default, deserialize_with = "deserialize_null_default")]
    pub size: i32,
    #[serde(default, deserialize_with = "deserialize_null_default")]
    pub source: i32,
    pub variant_order: Vec<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct PuzzlesData {
    pub puzzles: Vec<Puzzle>,
}

pub(crate) fn parse_progress_file(file_path: &PathBuf) -> Result<PuzzlesData> {
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

#[derive(Clone, Copy)]
pub(crate) struct LevelLookup {
    pub(crate) dirname: &'static str,
    pub(crate) level_name: &'static str,
}

pub(crate) static PROPER_DIRNAME_LOOKUP: phf::Map<&'static str, LevelLookup> = phf_map! {
    "hello.txt" => LevelLookup { dirname: "01_Tutorial", level_name: "01 - The Very Basics" },
    "first_condition.txt" => LevelLookup { dirname: "01_Tutorial", level_name: "02 - Conditions May Apply" },
    "change-the-operators.txt" => LevelLookup { dirname: "01_Tutorial", level_name: "03 - In Comparison" },
    "empty-space.txt" => LevelLookup { dirname: "01_Tutorial", level_name: "04 - Explicit Nothingness" },
    "simple_quadrant.txt" => LevelLookup { dirname: "01_Tutorial", level_name: "05 - Simple Quadrant" },
    "tic-tac-toe-board.txt" => LevelLookup { dirname: "01_Tutorial", level_name: "06 - 3x3 Grid" },
    "colorful-grid.txt" => LevelLookup { dirname: "01_Tutorial", level_name: "07 - Importance of END" },
    "simple-sushi.txt" => LevelLookup { dirname: "01_Tutorial", level_name: "08 - Simple Sushi" },
    "basic_cup.txt" => LevelLookup { dirname: "01_Tutorial", level_name: "09 - Basic Cup" },
    "nested_if.txt" => LevelLookup { dirname: "01_Tutorial", level_name: "10 - Quadrants" },
    "x-wall.txt" => LevelLookup { dirname: "01_Tutorial", level_name: "11 - Variable Outcomes" },
    "simple_stairs.txt" => LevelLookup { dirname: "02_Intro_Challenges", level_name: "01 - Staircase" },
    "simple_diagonal.txt" => LevelLookup { dirname: "02_Intro_Challenges", level_name: "02 - Diagonal Line" },
    "full_diagonal.txt" => LevelLookup { dirname: "02_Intro_Challenges", level_name: "03 - Big X" },
    "hello_modulo.txt" => LevelLookup { dirname: "02_Intro_Challenges", level_name: "04 - Hello, Modulo" },
    "checkerboard.txt" => LevelLookup { dirname: "02_Intro_Challenges", level_name: "05 - Checkerboard" },
    "angled_rainbow.txt" => LevelLookup { dirname: "02_Intro_Challenges", level_name: "06 - Angled Rainbow" },
    "simple_table.txt" => LevelLookup { dirname: "02_Intro_Challenges", level_name: "07 - Wooden Table" },
    "strawberry_cake_slice.txt" => LevelLookup { dirname: "03_Alice_01", level_name: "01 - Strawberry Cake Slice" },
    "basic_hourglass.txt" => LevelLookup { dirname: "03_Alice_01", level_name: "02 - Basic Hourglass" },
    "mini-duck.txt" => LevelLookup { dirname: "03_Alice_01", level_name: "03 - Tiny Duck" },
    "reverse-stairs.txt" => LevelLookup { dirname: "03_Alice_01", level_name: "04 - Stairwell" },
    "chair.txt" => LevelLookup { dirname: "03_Alice_01", level_name: "05 - Little Chair" },
    "strawberry.txt" => LevelLookup { dirname: "03_Alice_01", level_name: "06 - Strawberry" },
    "doggo.txt" => LevelLookup { dirname: "04_Alice_02", level_name: "01 - Doggo" },
    "fancy_hourglass.txt" => LevelLookup { dirname: "04_Alice_02", level_name: "02 - Fancy Hourglass" },
    "not_flower.txt" => LevelLookup { dirname: "04_Alice_02", level_name: "03 - Not a Flower :)" },
    "tiled_room.txt" => LevelLookup { dirname: "04_Alice_02", level_name: "04 - Tiled Room" },
    "brick.txt" => LevelLookup { dirname: "04_Alice_02", level_name: "05 - Brick Wall" },
    "puzzle_cube.txt" => LevelLookup { dirname: "04_Alice_02", level_name: "06 - Puzzle Cube" },
    "cute_computer.txt" => LevelLookup { dirname: "04_Alice_02", level_name: "07 - Cute Computer" },
    "penguin_i_guess.txt" => LevelLookup { dirname: "05_Alice_03", level_name: "01 - Penguin?" },
    "tic-tac-toe-game.txt" => LevelLookup { dirname: "05_Alice_03", level_name: "02 - Tic-Tac-Toe" },
    "creamsicle.txt" => LevelLookup { dirname: "05_Alice_03", level_name: "03 - Orange Creamsicle" },
    "cute_building.txt" => LevelLookup { dirname: "05_Alice_03", level_name: "04 - Building" },
    "taco.txt" => LevelLookup { dirname: "05_Alice_03", level_name: "05 - Taco" },
    "camera.txt" => LevelLookup { dirname: "05_Alice_03", level_name: "06 - Camera" },
    "gameboy.txt" => LevelLookup { dirname: "05_Alice_03", level_name: "07 - Nostalgic Handheld Game" },
    "mini_truck.txt" => LevelLookup { dirname: "06_Game_Ideas", level_name: "01 - Mini Truck" },
    "octopus.txt" => LevelLookup { dirname: "06_Game_Ideas", level_name: "02 - Octopus" },
    "winter-hat.txt" => LevelLookup { dirname: "06_Game_Ideas", level_name: "03 - Winter Hat" },
    "wide_tank.txt" => LevelLookup { dirname: "06_Game_Ideas", level_name: "04 - Toy Tank" },
    "outlet.txt" => LevelLookup { dirname: "06_Game_Ideas", level_name: "05 - Power Outlet" },
    "d6.txt" => LevelLookup { dirname: "06_Game_Ideas", level_name: "06 - Roll a D6" },
    "3do.txt" => LevelLookup { dirname: "06_Game_Ideas", level_name: "07 - First-gen 3D game console" },
    "impossible_tower.txt" => LevelLookup { dirname: "07_More_Game_Ideas", level_name: "01 - Improbable Tower" },
    "groucho.txt" => LevelLookup { dirname: "07_More_Game_Ideas", level_name: "02 - Clever Disguise" },
    "bed.txt" => LevelLookup { dirname: "07_More_Game_Ideas", level_name: "03 - Bed" },
    "sofa.txt" => LevelLookup { dirname: "07_More_Game_Ideas", level_name: "04 - Sofa" },
    "biplane.txt" => LevelLookup { dirname: "07_More_Game_Ideas", level_name: "05 - Biplane" },
    "school-desk.txt" => LevelLookup { dirname: "07_More_Game_Ideas", level_name: "06 - School Desk" },
    "football.txt" => LevelLookup { dirname: "08_Sports", level_name: "01 - Football" },
    "tennis_ball.txt" => LevelLookup { dirname: "08_Sports", level_name: "02 - Tennis Ball" },
    "baseball_bat.txt" => LevelLookup { dirname: "08_Sports", level_name: "03 - Baseball Bat" },
    "basketball.txt" => LevelLookup { dirname: "08_Sports", level_name: "04 - Basketball Ball" },
    "tennis_raquet.txt" => LevelLookup { dirname: "08_Sports", level_name: "05 - Tennis Racquet" },
    "basketball_hoop.txt" => LevelLookup { dirname: "08_Sports", level_name: "06 - Basketball Hoop" },
    "bowling.txt" => LevelLookup { dirname: "08_Sports", level_name: "07 - Bowling" },
    "8ball.txt" => LevelLookup { dirname: "08_Sports", level_name: "08 - 8-Ball" },
    "pool-table.txt" => LevelLookup { dirname: "08_Sports", level_name: "09 - Billiards Table" },
    "keyboard.txt" => LevelLookup { dirname: "09_Music", level_name: "01 - Synthesizer" },
    "guitar.txt" => LevelLookup { dirname: "09_Music", level_name: "02 - Guitar" },
    "headphones.txt" => LevelLookup { dirname: "09_Music", level_name: "03 - Headphones" },
    "xylophone.txt" => LevelLookup { dirname: "09_Music", level_name: "04 - Xylophone" },
    "no_sign.txt" => LevelLookup { dirname: "10_Circles_From_Cubes", level_name: "01 - NO" },
    "green_planet.txt" => LevelLookup { dirname: "10_Circles_From_Cubes", level_name: "02 - Green Planet" },
    "cookie.txt" => LevelLookup { dirname: "10_Circles_From_Cubes", level_name: "03 - Cookie" },
    "burger.txt" => LevelLookup { dirname: "10_Circles_From_Cubes", level_name: "04 - Burger" },
    "donut.txt" => LevelLookup { dirname: "10_Circles_From_Cubes", level_name: "05 - Donut" },
    "watermelon.txt" => LevelLookup { dirname: "10_Circles_From_Cubes", level_name: "06 - Watermelon" },
    "u-pipe.txt" => LevelLookup { dirname: "10_Circles_From_Cubes", level_name: "07 - U Pipe" },
    "angle-stack.txt" => LevelLookup { dirname: "11_Geometry_01", level_name: "01 - Angle Stack" },
    "nested_frames.txt" => LevelLookup { dirname: "11_Geometry_01", level_name: "02 - Nested Frames" },
    "mini_dna.txt" => LevelLookup { dirname: "11_Geometry_01", level_name: "03 - Mini DNA" },
    "spiral.txt" => LevelLookup { dirname: "11_Geometry_01", level_name: "04 - Spiral" },
    "framework.txt" => LevelLookup { dirname: "11_Geometry_01", level_name: "05 - Framework" },
    "roman_temple.txt" => LevelLookup { dirname: "11_Geometry_01", level_name: "06 - Roman Temple" },
    "corner-intersect.txt" => LevelLookup { dirname: "12_Geometry_02", level_name: "01 - Corner Intersect" },
    "octo-gem.txt" => LevelLookup { dirname: "12_Geometry_02", level_name: "02 - Octo-Gem" },
    "axis_frame.txt" => LevelLookup { dirname: "12_Geometry_02", level_name: "03 - Axis Frame" },
    "xyz-lattice.txt" => LevelLookup { dirname: "12_Geometry_02", level_name: "04 - XYZ Lattice" },
    "tri-pyramid.txt" => LevelLookup { dirname: "12_Geometry_02", level_name: "05 - Tri-Pyramid" },
    "triple-spiral.txt" => LevelLookup { dirname: "12_Geometry_02", level_name: "06 - Triple Spiral" },
    "menger_sponge.txt" => LevelLookup { dirname: "13_Fractals", level_name: "01 - Menger Sponge" },
    "t-square.txt" => LevelLookup { dirname: "13_Fractals", level_name: "02 - T-Square" },
    "vicsek.txt" => LevelLookup { dirname: "13_Fractals", level_name: "03 - Vicsek Snowflake" },
    "fractal-castle.txt" => LevelLookup { dirname: "13_Fractals", level_name: "04 - Fractal Castle (Cantor)" },
    "traffic_light.txt" => LevelLookup { dirname: "14_Time_Axis", level_name: "01 - Traffic Light" },
    "toaster.txt" => LevelLookup { dirname: "14_Time_Axis", level_name: "02 - Toaster" },
    "treadmill.txt" => LevelLookup { dirname: "14_Time_Axis", level_name: "03 - Treadmill" },
    "waterfall.txt" => LevelLookup { dirname: "14_Time_Axis", level_name: "04 - Waterfall" },
    "seven_seg.txt" => LevelLookup { dirname: "14_Time_Axis", level_name: "05 - 7-Segment Display" },
    "ferris-wheel.txt" => LevelLookup { dirname: "14_Time_Axis", level_name: "06 - Ferris Wheel" },
    "roadtrip.txt" => LevelLookup { dirname: "14_Time_Axis", level_name: "07 - Road Trip!" },
    "stairs-bounce.txt" => LevelLookup { dirname: "15_Animated_Game_Concepts", level_name: "01 - Bouncing Down" },
    "tv_color_bars.txt" => LevelLookup { dirname: "15_Animated_Game_Concepts", level_name: "02 - CRT TV (No Signal)" },
    "bouncing_ball.txt" => LevelLookup { dirname: "15_Animated_Game_Concepts", level_name: "03 - Bouncing Ball" },
    "island.txt" => LevelLookup { dirname: "15_Animated_Game_Concepts", level_name: "04 - Island" },
    "clock.txt" => LevelLookup { dirname: "15_Animated_Game_Concepts", level_name: "05 - Analog Clock" },
    "dolphin.txt" => LevelLookup { dirname: "15_Animated_Game_Concepts", level_name: "06 - Dolphin" },
};

pub(crate) struct DataParser<'a> {
    pub(crate) input: &'a str,
    pub(crate) pos: usize,
}

impl<'a> DataParser<'a> {
    pub(crate) fn new(input: &'a str) -> Self {
        Self { input, pos: 0 }
    }

    pub(crate) fn skip_whitespace(&mut self) {
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

    pub(crate) fn parse_value(&mut self) -> Result<serde_json::Value> {
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

    pub(crate) fn parse_string(&mut self) -> Result<String> {
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

    pub(crate) fn parse_bool(&mut self) -> Result<bool> {
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

    pub(crate) fn parse_number(&mut self) -> Result<serde_json::Value> {
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

        // Try to parse as integer first
        if let Ok(n) = s.parse::<u64>() {
            return Ok(serde_json::Value::Number(n.into()));
        }
        if let Ok(n) = s.parse::<i64>() {
            return Ok(serde_json::Value::Number(n.into()));
        }

        // Fallback to float
        let n: f64 = s
            .parse()
            .with_context(|| format!("failed to parse number: {}", s))?;

        // If it's effectively a whole number, convert it to an integer so serde_json
        // can deserialize it into integer fields like u32.
        if n.is_finite() && n.fract() == 0.0 {
            return Ok(serde_json::Value::Number((n as i64).into()));
        }

        // If we can't parse as a number, return a default value
        Ok(serde_json::Number::from_f64(n)
            .map(serde_json::Value::Number)
            .unwrap_or(serde_json::Value::default()))
    }

    pub(crate) fn parse_array(&mut self) -> Result<serde_json::Value> {
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

    pub(crate) fn parse_object(&mut self) -> Result<serde_json::Value> {
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

pub(crate) fn sanitize_dir_string(dir_name: &str) -> String {
    static REG1: LazyLock<Regex> = LazyLock::new(|| Regex::new(r"[^0-9A-Za-z_]").unwrap());
    static REG2: LazyLock<Regex> = LazyLock::new(|| Regex::new(r"_+$").unwrap());

    let name = dir_name.replace(" ", "_").replace(".", "_");
    let name = REG1.replace_all(&name, "");
    let name = REG2.replace_all(&name, "");
    name.to_string()
}
