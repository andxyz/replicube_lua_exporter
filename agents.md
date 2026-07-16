# Agents

This file documents how to build and test the exporters from the root directory.

## Test Commands

### Rust

```sh
cd replicube_lua_exporter_rust/ && cargo build && ./target/debug/replicube_lua_exporter_rust -f ./large_progress.dat -o ../solutions_test_rust && cd -
```

### Golang

```sh
cd replicube_lua_exporter_golang/ && go build -trimpath -ldflags="-s -w" && ./replicube_lua_exporter -f ./large_progress.dat -o ../solutions_test_golang/ && cd -
```

## Notes

- Both commands must be run from the **root of the repository**.
- Each command `cd`s into its respective project directory, builds the binary, runs it against `large_progress.dat`, writes output to a sibling directory (`solutions_test_rust` or `solutions_test_golang`), then returns to the root via `cd -`.
- Output directories (`solutions_test_rust/`, `solutions_test_golang/`) will be created relative to the root if they do not already exist.
