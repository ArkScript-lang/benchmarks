#!/usr/bin/env python3.6
import time


def fibo(n):
    if n < 2:
        return n
    else:
        return fibo(n - 1) + fibo(n - 2)


if __name__ == '__main__':
    start = time.perf_counter()
    for i in range(125):
        fibo(28)
    stop = (time.perf_counter() - start) * 1000  # time.perf_counter is in seconds

    mean = stop / 125
    print(f"Python {mean} ms")
