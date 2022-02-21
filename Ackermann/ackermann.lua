local function ackermann(m, n)
  if m == 0 then return n + 1 end
  if n == 0 then return ackermann(m-1,1) end
  return ackermann(m-1, ackermann(m, n-1))
end

local socket=require 'socket'

start = socket.gettime()
for i=1,125 do
  ackermann(3, 6)
end

mean = ((socket.gettime() - start) * 1000) / 125

print("Lua", mean, "ms")
