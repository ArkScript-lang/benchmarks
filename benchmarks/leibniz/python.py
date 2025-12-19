#!/usr/bin/env python

def main():
    rounds = 10000000

    x = 1.0
    pi = 1.0

    for i in range(2, rounds + 3):
        x = -x
        pi += x / (2 * i - 1)

    pi *= 4.0
    print("{:.16f}".format(pi))


main()
