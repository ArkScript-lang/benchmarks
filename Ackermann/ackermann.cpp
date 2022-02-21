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
  for (std::size_t i = 0; i < 125; ++i)
    ack(3, 6);
  auto end = std::chrono::steady_clock::now();

  std::cout << "C++ "
            << std::chrono::duration_cast<std::chrono::milliseconds>(end -
                                                                     begin)
                   .count()
            << " ms" << std::endl;

  return 0;
}
