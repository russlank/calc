# Calc LangForge Demo

This repo contains a minimal runnable LangForge calculator example.

The source grammar is [calc.lf](calc.lf). The sample input is
[input.calc](input.calc).

This project depends on `lang-forge`. Installation and usage instructions are
available at [russlank/lang-forge](https://github.com/russlank/lang-forge).

## Prerequisites

- `lang-forge` available on your `PATH`
- `go` available on your `PATH`

## Common Commands

Run from this directory:

```sh
make validate
make generate
make build
make run
make test
make clean
```

`make run` validates the spec, generates Go code into `generated/`, builds
`dist/calc-demo`, runs it with `input.calc`, and writes a report to
`dist/calc-demo.log`.

## VS Code Run And Debug

This repository includes workspace config under `.vscode/` for Go + LangForge
development.

- Build/test and language analysis are configured with the `langforge_generated`
	tag.
- Tasks are available for validate/generate/build/run/test/clean.
- Launch profiles are available for debugging the demo binary and demo tests.

Use the following in VS Code:

- Run Task: `make: run` to generate/build/run quickly.
- Run Build Task: `make: build`.
- Run Test Task: `make: test`.
- Start Debugging with `Debug calc-demo` to run `cmd/calc-demo` with
	`input.calc`.
- Start Debugging with `Debug calc-demo tests` to debug tests in
	`cmd/calc-demo`.

## Project Layout

| Path | Role |
|---|---|
| `calc.lf` | LangForge source grammar |
| `generated/` | Regenerated scanner/parser output |
| `semantics/reducer.go` | Handwritten reducer implementation |
| `cmd/calc-demo` | Demo command |

The generated Go-dependent files use build tag `langforge_generated`. This
keeps a clean source checkout buildable before generation.
