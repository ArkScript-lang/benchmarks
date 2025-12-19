var rounds = 10000000
var x = 1.0
var pi = 1.0

for (i in 2...(rounds+3)) {
  x = -x
  pi = pi + x / (2 * i - 1)
}

pi = pi * 4
System.print(pi)
