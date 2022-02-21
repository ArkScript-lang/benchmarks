def ack(m, n)
  if m > 0
    if n == 0
      return ack(m - 1, 1)
    else
      return ack(m - 1, ack(m, n - 1))
    end
  else
    return n + 1
  end
end

start = Time.new
1000.times do |i|
  ack(3, 6)
end

stop = (Time.new - start) * 1000  # Time.new is in seconds
mean = stop / 1000
puts("Ruby #{mean} ms")
