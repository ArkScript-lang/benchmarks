function ack(m, n) {
    if (m > 0) {
        if (n == 0) {
            return ack(m - 1, 1);
        } else {
            return ack(m - 1, ack(m, n - 1));
        }
    } else {
        return n + 1;
    }
}

var t0 = process.hrtime();

for (var i = 0; i < 1000; ++i) {
    ack(3, 6);
}

var stop = process.hrtime(t0);

mean = stop[1] / 1000000;  // process.hrtime(start_time) returns [seconds, nanoseconds]
mean /= 1000;

console.log(`NodeJS ${mean} ms`);