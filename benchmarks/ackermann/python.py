import sys
sys.setrecursionlimit(10000)

def ack(m, n):
    if m > 0:
        if n == 0:
            return ack(m - 1, 1)
        else:
            return ack(m - 1, ack(m, n - 1))
    else:
        return n + 1


if __name__ == '__main__':
    ack(3, 7)