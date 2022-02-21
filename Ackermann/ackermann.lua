local function ackermann(m, n)
  if m == 0 then return n + 1 end
  if n == 0 then return ackermann(m-1,1) end
  return ackermann(m-1, ackermann(m, n-1))
end

start_time = os.time()
for i=1,1000 do
  ackermann(3, 6)
end

end_time = os.time()
elapsed_time = os.difftime(end_time, start_time)
mean = (elapsed_time * 1000) / 1000

print("Lua", mean, "ms")
