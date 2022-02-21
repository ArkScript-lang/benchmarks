function fibo(n) {
    if (n < 2)
        return n;
    else
        return fibo(n - 1) + fibo(n - 2);
}

var t0 = process.hrtime();

for (var i = 0; i < 125; ++i) {
    fibo(28);
}

var stop = process.hrtime(t0);

mean = stop[1] / 1000000;  // process.hrtime(start_time) returns [seconds, nanoseconds]
mean /= 125;

console.log(`NodeJS ${mean} ms`);