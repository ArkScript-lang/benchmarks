var fibRec
fibRec = Fn.new { |n|
    if (n < 2) return n
    return fibRec.call(n-1) + fibRec.call(n-2)
}

fibRec.call(28)
