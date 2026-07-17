# Agents

This file documents how to build and test:

- the rust based exporter
- the golang based exporter

## Test Commands

List all the mise tasks

```sh
mise tasks --all
```

### Rust

Test the rust CLI

```sh
mise //replicube_lua_exporter_rust:test
```

### Golang

Test the golang CLI

```sh
mise //replicube_lua_exporter_golang:test
```

## Notes

- Each command writes output to a sibling directory (`./test/solutions_rust/` or `./test/solutions_golang/`) 
- Output directories (`./test/solutions_rust/` or `./test/solutions_golang/`) will be created relative to the root if they do not already exist.
