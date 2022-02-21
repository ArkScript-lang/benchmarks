#include <chrono>
#include <iostream>

unsigned ack(unsigned m, unsigned n) {
  if (m > 0) {
    if (n == 0)
      return ack(m - 1, 1);
    else
      return ack(m - 1, ack(m, n - 1));
  } else
    return n + 1;
}

int main(int argc, char **argv) {
  auto begin = std::chrono::steady_clock::now();
  unsigned acc = 0;
  for (std::size_t i = 0; i < 1000; ++i)
    acc += ack(3, 6);
  auto end = std::chrono::steady_clock::now();
  auto delta = static_cast<double>(
      std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count()) / 1000.0;

  std::cout << "C++ " << (delta / 1000.0) << " ms" << std::endl;

  return acc;
}
