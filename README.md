# Benchmarks

*results are sorted from slowest to fastest*

Compiled on WSL (Ubuntu 18.04.3 LTS 64 bits), 125 runs of each test.

Running on 8 X 1992 MHz CPU
CPU Caches:
* L1 Data 32K (x4)
* L1 Instruction 32K (x4)
* L2 Unified 256K (x4)
* L3 Unified 8192K (x1)

Programs used:
* C++: g++ 8.3.0
* Java: OpenJDK 11.0.6 64 bits
* Lua: Lua 5.1.5
* Python: Python 3.6.9
* JavaScript: Node v12.16.3
* Ruby: 2.5.1p57 x86_64

## Ackermann Péter test

The Ackermann function, due to its definition in terms of extremely deep recursion, can be used as a benchmark of a compiler's ability to optimize recursion.

Parameters used are m=3 and n=6.

| data   | ArkScript | Python    | Lua      | Ruby     | JavaScript | C++      | Java     |
| ------ | --------- | --------- | -------- | -------- | ---------- | -------- | -------- |
| mean   | 50.0 ms   | 15.334 ms | 4.750 ms | 4.33 ms  | 0.513 ms   | 0.152 ms | 0.152 ms |
| median | 49.7 ms   | 13.095 ms | 4.666 ms | 4.28 ms  | 0.486 ms   | 0.144 ms | 0 ms     |
| stddev | 1.10 ms   | 5.068 ms  | 0.253 ms | 0.170 ms | 0.132 ms   | 0.012 ms | 0.359 ms |

## List allocation test

Allocating list of 1000 elements (all numbers, only 0).

| data   | Lua       | Ruby      | Java      | ArkScript  | JavaScript | Python     | C++         |
| ------ | --------- | --------- | --------- | ---------- | ---------- | ---------- | ----------- |
| mean   | 0.1647 ms | 0.034 ms  | 0.016 ms  | 0.015 ms   | 0.00826 ms | 0.00325 ms | 0.000618 ms |
| median | 0.1649 ms | 0.03 ms   | 0 ms      | 0.015 ms   | 0.0025 ms  | 0.0024 ms  | 0.000586 ms |
| stddev | 0.0813 ms | 0.0264 ms | 0.1254 ms | 0.001 ms   | 0.05493 ms | 0.00339 ms | 0.000097 ms |
