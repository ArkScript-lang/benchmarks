#include <chrono>
#include <iostream>

unsigned fibo(unsigned n) {
  if (n < 2)
    return n;
  else
    return fibo(n - 1) + fibo(n - 2);
}

int main(int argc, char **argv) {
  auto begin = std::chrono::steady_clock::now();
  unsigned acc = 0;
  for (std::size_t i = 0; i < 1000; ++i)
    acc += fibo(28);
  auto end = std::chrono::steady_clock::now();

  std::cout << "C++ "
            << std::chrono::duration_cast<std::chrono::milliseconds>(end -
                                                                     begin)
                   .count()
            << " ms" << std::endl;

  return acc;
}
