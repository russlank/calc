//go:build !langforge_generated

package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Fprintln(os.Stderr, "calc-demo requires generated LangForge output; run `make run`")
	os.Exit(2)
}
