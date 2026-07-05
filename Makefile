LANG_FORGE ?= lang-forge
GO ?= go

SPEC := calc.lf
TARGET := go
GENERATED_DIR := generated
DIST_DIR := dist
APP_NAME := calc-demo
BIN := $(DIST_DIR)/$(APP_NAME)
TAGS := langforge_generated
INPUT ?= input.calc
LOG ?= $(DIST_DIR)/calc-demo.log

.PHONY: validate generate build run test clean

validate:
	$(LANG_FORGE) validate --spec $(SPEC)

generate: validate
	$(LANG_FORGE) generate --spec $(SPEC) --target $(TARGET) --out $(GENERATED_DIR)

build: generate
	mkdir -p $(DIST_DIR)
	$(GO) build -tags $(TAGS) -trimpath -o $(BIN) ./cmd/$(APP_NAME)

run: build
	./$(BIN) --input $(INPUT) --log $(LOG)

test: generate
	$(GO) test -tags $(TAGS) -count=1 ./...

clean:
	rm -rf $(GENERATED_DIR) $(DIST_DIR)
