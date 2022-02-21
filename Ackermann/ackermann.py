import time


def ack(m, n):
    if m > 0:
        if n == 0:
            return ack(m - 1, 1)
        else:
            return ack(m - 1, ack(m, n - 1))
    else:
        return n + 1


if __name__ == '__main__':
    start = time.perf_counter()
    for i in range(1000):
        ack(3, 6)
    stop = (time.perf_counter() - start) * 1000  # time.perf_counter is in seconds

    mean = stop / 1000
    print(f"Python {mean} ms")