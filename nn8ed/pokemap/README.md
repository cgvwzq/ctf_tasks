Ok, I honestly thought this was an easy challenge. Unfortunately, I messed it up and the easy solution wasn't working :S I apologize for that. However, I think the challenge was still solvable (maybe). In fact, my idea was to make it solvable by many different approaches.

The JS logic was very simple: if we fight with `snorlax` (click over Albacete), the input message will be passed to a `verify` function, which is a wrapper for Wasm taking a `string` and returning a `number`:

```
Verify=Module.cwrap("verify","number",["string"])
```

This is the only Wasm entrypoint we are interested in, and corresponds to func 22. This can be easily seen by using `wasm2wat` and looking at the exports, or with `Module.asm._verify.toString() == function 22() { [native code] }`.

## Initial blackbox solution (didn't work):

Ideally it was going to be possible to solve the challenge just by blackbox testing. The global `verify` function was callable via DevTools' console:

```
> verify('nn8ed{foobar}')
-1
```

And it always returned `-1` unless the length of the string was `23`:

```
> verify('nn8ed{aaaaaaaaaaaaaaaaaaaaaaa}')
-40
```

When the lenght is correct, the function should return a value that was dependendant to the similarity between input and secret, so that by trying char by char was possible to progressively reduce the difference and find the flag.

Unfortunately, I deployed the wrong version where it just returns the `mpz_cmp` output of the encoded input and the secret, so this approach didn't work... Maybe this still leaks enough information for a bruteforce attack, but it's not trivial anymore.

## Smart guess solution:

`strings module.wasm | less` gives some info. On one hand, strings corresponding to the gmp library (even the version), so one can suppose that there's something going on with big integers. On the other, we can see an interesting long number:

`113883417854804734205272931355440788694200827387648583857573676327442526053146613050094697446744879249099281785455568244741403049418901590085173000595652023976447723574801246421998377496953662081977205128192835695618595003013531897093602805275070643669720901544931208221907840144204782361806858863609452134200476917361844582139661076618317634669257493529304035162565317931423519182235607017253888631759822594276543440000`

One thing people usually do with long numbers is to try to factorize them, in
this case we obtain something like this:

`2^7 · 3^15 · 5^4 · 7^5 · 11^12 · 13^9 · 17^19 · 19^20 · 23^8 · 29^5 · 31^13 · 37^5 · 41^23 · 43^20 · 47^23 · 53^15 · 59^15 · 61^6 · 67^13 · 71 · 73^20 · 79^8 · 83^19`

If you look carefully, you can see a clear pattern, bases correspond to the first 23 prime numbers (it's funny because 23 is also a prime, lol).  Furthermore, we can also know that the flag length is 23 (see RE solution).  Now, the jump of faith is that this should remind you of [Godel's encoding](https://en.wikipedia.org/wiki/G%C3%B6del_numbering). What means that the exponents are somehow our strings.

(By giving different inputs, adding breakpoints, and inspecting the memory it should be possible to identify similar numbers, which gives a big hint about how they are constructed.)

My first implementation was simply using ASCII values, but that seemed too obvious, so I added some preprocessing to the input (see RE solution) to make it a little bit harder.

The sequence is: `7 15 4 5 12 9 19 20 8 5 13 5 23 20 23 15 15 6 13 1 20 8 19`

If we map each char to the alphabet (starting with `a=1`, otherwise the exponent doesn't work), we get:

```
> String.fromCharCode(...[7,15,4,5,12,9,19,20,8,5,13,5,23,20,23,15,15,6,13,1,20,8,19].map(e=>e+97-1))
godelisthemewtwoofmaths
```

What gives us our flag! :)

## RE solution:

The last approach, and hardest, was to simply reverse engineer. I know the Wasm module was really huge and this scared a lot of people, but there were only a few interesting functions that we needed to understand what was going on.

Check `pokemap.c` to see the original C code. I used `emscripten` with default flags to compile it to Wasm.

First step is probably to use `wasm2c` (from the WebAssembly Toolkit) to convert the Wasm into some pseudo-C, but the code is not very helpful, so I would have gone towards a more dynamic path with DevTools.

...






