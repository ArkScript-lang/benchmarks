let data = []
for (let i = 0; i < 1000000; ++i)
    data.push(i)

let count = 0
for (let i of data)
    count += i