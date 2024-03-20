local function fibo(n)
    if n < 2 then return n
    else return fibo(n - 1) + fibo(n - 2)
    end
end

fibo(28)