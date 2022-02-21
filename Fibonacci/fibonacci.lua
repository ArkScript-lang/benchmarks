local function fibo(n)
    if n < 2 then return n
    else return fibo(n - 1) + fibo(n - 2)
    end
end

start_time = os.time()
for i=1,100 do
    fibo(28)
end

end_time = os.time()
elapsed_time = os.difftime(end_time, start_time)
mean = (elapsed_time * 1000) / 100

print("Lua", mean, "ms")