#!/bin/bash

# Flag: nn7ed{I'M AMAZING!}
# wat2wasm life.wat -o life.wasm

# Generate array buffer for pixels.js
# xxd -i life.wasm

node pixels.js > life.pdf
cat rick.pdf >> life.pdf
