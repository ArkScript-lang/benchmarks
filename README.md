# Benchmarks

*results are sorted from slowest to fastest*

Compiled on Windows 10 64bits (10.0.19044.1503), 125 runs of each test.

Running on 8 X 1992 MHz CPU
CPU Caches:
* L1 Data 32K (x4)
* L1 Instruction 32K (x4)
* L2 Unified 256K (x4)
* L3 Unified 8192K (x1)

Programs used:
* C++: clang++ 12.0.1 x86_64-pc-windows-msvc
* Java: java 17 2021-09-14 LTS
* Lua: Lua 5.4.2
* Python: Python 3.9.7
* JavaScript: Node v16.10.0
* Ruby: ruby 3.1.1p18 x64-mingw-ucrt

Ackermann
=========
- ArkScript 48.437340021133423 ms
- C++ 0.000556 ms
- Java 0.1798062 ms
- NodeJS 0.6233656999999999 ms
- Lua     3.0     ms
- Python 15.9357367 ms
- Ruby 5.5176437 ms

Fibonacci
=========
- ArkScript 413.226439952850342 ms
- C++ 1 ms
- Java 1.0648571 ms
- NodeJS 3.5218540000000003 ms
- Lua     20.0    ms
- Python 77.65378500000001 ms
- Ruby 29.726696 ms
