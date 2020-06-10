def allocate
  data = Array.new(1000){0}
  return data
end


results = []
125.times do |i|
  start = Time.new
  allocate
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