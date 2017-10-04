#!/bin/bash

# Flag: nn7ed{I'M AMAZING!}
# wat2wasm life.wat -o life.wasm

# Generate array buffer for pixels.js
# node -p "'[' + new Uint8Array(require('fs').readFileSync('life.wasm').buffer) + ']'"

node pixels.js > life.pdf
cat rick.pdf >> life.pdf
