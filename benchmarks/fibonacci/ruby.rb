def fibo(n)
    if n < 2
        return n
    else
        return fibo(n - 1) + fibo(n - 2)
    end
end


start = Time.new
100.times do |i|
  fibo(28)
end

stop = (Time.new - start) * 1000  # Time.new is in seconds
mean = stop / 100
puts("Ruby #{mean} ms")
