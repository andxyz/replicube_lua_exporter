
```txt
Querying Antigravity:

Compare the two directorys for golang and rust and see what features are different for the exporter. Use git to detect some differences. Use `mise tasks --all` to see some tasks.
```

# Comparative Analysis: Golang vs. Rust Replicube Lua Exporters

This document outlines the differences between the Golang and Rust implementations of the Replicube Lua Exporter:
- highlighting file structures
- CLI variations
- tasks
- git-tracked changes
- and execution differences (including bugs and discrepancies)

---

## 1. Directory & Codebase Structure

The exporter is implemented in two parallel versions in the repository:
*   [replicube_lua_exporter_golang](file:///home/andxyz/code/personal/replicube_lua_exporter/replicube_lua_exporter_golang)
*   [replicube_lua_exporter_rust](file:///home/andxyz/code/personal/replicube_lua_exporter/replicube_lua_exporter_rust)

### Directory File Maps

| Feature / File | Go Implementation | Rust Implementation |
| :--- | :--- | :--- |
| **CLI Entrypoint** | [`main.go`](file:///home/andxyz/code/personal/replicube_lua_exporter/replicube_lua_exporter_golang/main.go) | [`src/main.rs`](file:///home/andxyz/code/personal/replicube_lua_exporter/replicube_lua_exporter_rust/src/main.rs) |
| **Save File Parser** | [`godotdatparser.go`](file:///home/andxyz/code/personal/replicube_lua_exporter/replicube_lua_exporter_golang/godotdatparser.go) | [`src/mod_save_file_parser.rs`](file:///home/andxyz/code/personal/replicube_lua_exporter/replicube_lua_exporter_rust/src/mod_save_file_parser.rs) |
| **File Generation** | [`puzzlejsonparser.go`](file:///home/andxyz/code/personal/replicube_lua_exporter/replicube_lua_exporter_golang/puzzlejsonparser.go) | [`src/mod_puzzledata_processor.rs`](file:///home/andxyz/code/personal/replicube_lua_exporter/replicube_lua_exporter_rust/src/mod_puzzledata_processor.rs) & [`src/mod_json_outputfile_creator.rs`](file:///home/andxyz/code/personal/replicube_lua_exporter/replicube_lua_exporter_rust/src/mod_json_outputfile_creator.rs) |
| **Directory Lookup** | [`dirnamelookup.go`](file:///home/andxyz/code/personal/replicube_lua_exporter/replicube_lua_exporter_golang/dirnamelookup.go) | Embedded within `mod_save_file_parser.rs` (`PROPER_DIRNAME_LOOKUP`) |

---

## 2. CLI Options

Both exporters expose similar functionality via flags, but use different parsing libraries.

*   **Go** uses the standard library `flag` package:
    *   `-file` / `-f`: Path to the input `progress.dat` save file.
    *   `-outdir` / `-o`: Output directory for the exported Lua files and the unified `puzzles.json`.
*   **Rust** uses the `clap` crate (via the `derive` API):
    *   `--file` / `-f`: Path to the input `progress.dat`.
    *   `--outdir` / `-o`: Output directory.

---

## 3. Tasks (`mise tasks --all`)

Using `mise tasks --all` reveals tasks configured in the root, `replicube_lua_exporter_golang/mise.toml`, and `replicube_lua_exporter_rust/mise.toml`.

### Root Tasks
*   `//:copy_savegame`: Copies the local active game save (`~/.local/share/Replicube/progress.dat`) into `./test/large_progress.dat` to use for testing.
*   `//:dump`: Uses the Go exporter to export/dump the savegame contents into a personal repository (`~/code/personal/replicube_solutions`).
*   `//:lint:hk`: Lints project files utilizing `hk check --all`.

### Go-specific Tasks (`//replicube_lua_exporter_golang`)
*   `:build`: Builds the Go binary (`go build -trimpath -ldflags='-s -w'`).
*   `:test`: Executes the export test and diffs the output with the Rust solutions directory.
*   `:test:export`: Exports the test save file `large_progress.dat` into `test/solutions_golang`.
*   `:test:compare_dirs`: Runs `diff` comparing the Go-exported files directory-wide with the Rust-exported ones (excluding `puzzles.json`).
*   `:clean_tests_golang`: Removes `test/solutions_golang`.

### Rust-specific Tasks (`//replicube_lua_exporter_rust`)
*   `:build`: Compiles the cargo project.
*   `:test`: Runs the cargo unit test suite, runs the export test, and compares output directories with Go.
*   `:test:cargo_test`: Runs `cargo test` unit tests.
*   `:test:export`: Exports `large_progress.dat` into `test/solutions_rust`.
*   `:test:compare_dirs`: Compares directories (excluding `puzzles.json`) with Go.
*   `:clean_tests_rust`: Removes `test/solutions_rust`.

---

## 4. Git-Detected Differences & History

Checking `git log` reveals key steps taken to align both implementations:

1.  **Rust Port (`ade2fc3`)**: The project was originally written in Go and later ported to Rust.
2.  **Number Output Alignment (`9deaa6f`, `8f8308d`)**:
    *   Initially, Go formatted integers and floats differently. Go uses `SpecialNumber` to ensure that integers serialized to JSON contain a `.0` suffix (e.g. `3.0` instead of `3`) to match floating-point formatting.
    *   Rust handles this by parsing numbers as floats, but turning whole floats back into `i64` integers inside the custom parser (`mod_save_file_parser.rs`) so Serde can map them onto integer fields, then serializing them out appropriately.
3.  **Weekly Puzzles (`5a76bab`, `446c77b`)**:
    *   Go added support for exporting weekly puzzles (where `source == 400`) in tag `v1.0.4`.
    *   This was subsequently ported to the Rust project in branch `andxyz-rust-export-weekly-puzzles` (merged to `main`).
4.  **Logging Refactoring (`d14068c`)**:
    *   Rust migrated its console tracing outputs from `println!` to the `log` crate (`log::info!`).
    *   Because the `log` logger isn't initialized in `main.rs`, the Rust program runs silently by default, while the Go exporter defaults to printing warning logs using Go's built-in `log/slog`.
5.  **Level Names Porting (`f499311`)**:
    *   The complete table of level directory/set names was ported from Go's `dirnamelookup.go` to Rust's static `PROPER_DIRNAME_LOOKUP` map using `phf`.

---

## 5. Behavior Discrepancies & Discovered Bugs

Executing tests and comparing outputs reveals several differences:

### ⚠️ Bug: Rust UTF-8 to Latin-1 Conversion
When parsing strings in the custom Godot `progress.dat` parser, Rust incorrectly decodes raw UTF-8 bytes:
```rust
// replicube_lua_exporter_rust/src/mod_save_file_parser.rs
} else {
    s.push(c as char); // <-- BUG: treats byte c (0-255) directly as a char point
    self.pos += 1;
}
```
*   **Result**: UTF-8 characters like `®` (bytes `0xC2 0xAE`) are decoded as two characters `Â®` (`U+00C2` and `U+00AE`), resulting in corrupted export text.
*   **Go** avoids this by appending raw bytes directly to a `strings.Builder` (preserving original byte sequences).

### 🔍 JSON Output Differences (`puzzles.json`)
Even though the Lua script files match structurally, the generated `puzzles.json` files differ:
1.  **HTML-Escaping**: Go's default JSON encoder escapes HTML operators (converting `<` to `\u003c` and `>` to `\u003e`), while Rust's `serde_json` does not.
2.  **Map Key Sorting**: In Go, map keys (e.g. `code_variants`) are serialized alphabetically. In Rust, `HashMap` keys are printed in an arbitrary/random order.

---

## 6. Testing Strategies

*   **Go Exporter**: Has **no unit tests** at all. It relies purely on integration checks (generating `test/solutions_golang` and diffing it with Rust).
*   **Rust Exporter**: Has a **comprehensive unit test suite** (16 tests verifying parsing, directory sanitization, struct deserialization, and output generation) in addition to the integration diffs.
