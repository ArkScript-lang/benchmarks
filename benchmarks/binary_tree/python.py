# The Computer Language Benchmarks Game
# http://shootout.alioth.debian.org/
#
# contributed by Antoine Pitrou
# modified by Dominique Wahli
# modified by Heinrich Acker
# modified by Alexandre Plateau

def make_tree(item, depth):
    if not depth:
        return item, None, None
    item2 = item + item
    depth -= 1
    return item, make_tree(item2 - 1, depth), make_tree(item2, depth)


def check_tree(node):
    item, left, right = node
    if not left:
        return item
    return item + check_tree(left) - check_tree(right)


min_depth = 4
max_depth = 12
stretch_depth = max_depth + 1

check_tree(make_tree(0, stretch_depth))

long_lived_tree = make_tree(0, max_depth)

iterations = 2 ** max_depth
for depth in range(min_depth, stretch_depth, 2):
    check = 0
    for i in range(1, iterations + 1):
        check += check_tree(make_tree(i, depth)) + check_tree(make_tree(-i, depth))
    iterations //= 4

check_tree(long_lived_tree)
