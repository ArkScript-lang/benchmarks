var Ackermann
Ackermann = Fn.new {|m, n|
    if (m == 0) return n + 1
    if (n == 0) return Ackermann.call(m - 1, 1)
    return Ackermann.call(m - 1, Ackermann.call(m, n - 1))
}

Ackermann.call(3, 7)
