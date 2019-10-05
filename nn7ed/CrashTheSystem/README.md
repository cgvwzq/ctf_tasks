# CrashTheSystem

## Category:

`web` + `forensic`

## Description:

NodeJS backend will crash and generate a coredump after every uncatched exception. It's easy to generate an exception in Express, just make the decoding of URL fail. The coredump is accessible via web (each crash generates a unique id that the user receives). After downloading the coredump the JS source is available (e.g., with `strings core`), but the authentication module is a native addon (coded in C++) and forces to use `gdb`, `lldb`, `llnode` or anyother tool.

The authentication module accepts a user and password and compares them with two stored values. If the values are valid, the flag is read from a file and displayed to the user.

## Hints:
* The title of the challenge.
* `robots.txt` showing a disallow for the `/cores/` directoy, and a "secret" file with a youtube video.
* `X-CorePattern: core.f4d0da4d` returned together with the stack trace.

## Build docker image:

```
$ docker build -t crashthesystem .
```

## Run docker:

```
$ docker run -d --name crashthesystem --restart=always -p 3000:3000 crashthesystem
```

## Writeup:

robots.txt (hint for /cores/ directory)

Obtain coredump after crashing Express (e.g.: `http://localhost:3000/api/%e4`)

`strings` to understand JS logic and find hidden admin panel

`readelf` to get addresses for admin.node native module

`r2` disassemble the offsets (both user and pwd are hardcoded, no need for reversing)

```
$ curl http://localhost:3000/admin/bettersafethisinbookmarkslol -X "POST" -H "Content-Type: application/json" -d '{"user":"snuffles", "pass":"wolol0o0"}'
{"flag":"nn7ed{Br3ak_the_cycl3_MoRty_r1s3_ab0v3_f0cu$_ON_sc1enc3}\n"}
```
