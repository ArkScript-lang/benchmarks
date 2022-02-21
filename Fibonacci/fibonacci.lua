local function fibo(n)
    if n < 2 then return n
    else return fibo(n - 1) + fibo(n - 2)
    end
end

local socket=require 'socket'

start = socket.gettime()
for i=1,125 do
    fibo(28)
end

mean = ((socket.gettime() - start) * 1000) / 125

print("Lua", mean, "ms")