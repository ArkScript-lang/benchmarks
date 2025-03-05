// The Computer Language Benchmarks Game
// http://shootout.alioth.debian.org/
//
// contributed by Antoine Pitrou
// modified by Dominique Wahli
// modified by Heinrich Acker
// translated by Alexandre Plateau

function makeTree(item, depth) {
    if (depth === 0) {
        return { item, left: null, right: null };
    }
    let item2 = item * 2;
    depth--;
    return {
        item,
        left: makeTree(item2 - 1, depth),
        right: makeTree(item2, depth)
    };
}

function checkTree(node) {
    if (!node.left) {
        return node.item;
    }
    return node.item + checkTree(node.left) - checkTree(node.right);
}

const minDepth = 4;
const maxDepth = 12;
const stretchDepth = maxDepth + 1;

checkTree(makeTree(0, stretchDepth));

const longLivedTree = makeTree(0, maxDepth);

let iterations = 2 ** maxDepth;
for (let depth = minDepth; depth <= maxDepth; depth += 2) {
    let check = 0;
    for (let i = 1; i <= iterations; i++) {
        check += checkTree(makeTree(i, depth)) + checkTree(makeTree(-i, depth));
    }
    iterations = Math.floor(iterations / 4);
}

checkTree(longLivedTree);
