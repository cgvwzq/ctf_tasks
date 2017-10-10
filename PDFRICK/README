# PDF RICK

## Category:

`misc` + `rev`

## Description:

Hand crafted PDF only working on `pdfium` (aka Chrome). It displays an interactive Game Of Life and the task is to find the easter egg.

Unfortunately, nobody solved this task during the competition. You should try before reading more.

## Writeup:

Opening the pdf with a text editor shows some weird stuff, but also a crystal clear Javascript with an `easter` function and a WebAssembly module.

The `easter` function is imported by the WASM module and performs an `eval` of a XORed string with a parameter passed by the caller.

The WASM module exports a function `tick` that seems to update the state of the game (hence, the logic is implemented in WASM). The objective is reverse engineer the WASM module and see how the easter egg is triggered.

It turns out that after every "tick" a function checking the state of the world is triggered, if this state corresponds to an stored value the imported function is called showing an alert dialog. This secret state corresponds to a map showing the flag: `nn7ed{I'M AMAZING!}`.
