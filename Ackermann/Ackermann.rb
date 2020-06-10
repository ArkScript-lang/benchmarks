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

results = []
125.times do |i|
  start = Time.new
  ack(3,6)
  stop = Time.new - start
  results << stop * 1000  # Time.new is in seconds
end
mean = results.inject(:+) / results.size
puts("Mean time: #{mean}ms")

results = results.sort
median = 0
if results.size % 2 == 0
  median = results[results.size.to_i / 2 - 1] + results[results.size.to_i / 2]
  median /= 2
else
  median = results[results.size.to_i / 2]
end
puts("Median time: #{median}ms")

stddev = (results.inject(0){|save, a| save + (a - mean) ** 2} / 125) ** 0.5
puts("Stddev: #{stddev}ms")
