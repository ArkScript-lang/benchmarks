// Ported from the Python version.

class Tree {
  construct new(item, depth) {
    _item = item
    if (depth > 0) {
      var item2 = item + item
      depth = depth - 1
      _left = Tree.new(item2 - 1, depth)
      _right = Tree.new(item2, depth)
    }
  }

  check {
    if (_left == null) {
      return _item
    }

    return _item + _left.check - _right.check
  }
}

var minDepth = 4
var maxDepth = 12
var stretchDepth = maxDepth + 1

Tree.new(0, stretchDepth).check

var longLivedTree = Tree.new(0, maxDepth)

// iterations = 2 ** maxDepth
var iterations = 1
for (d in 0...maxDepth) {
  iterations = iterations * 2
}

var depth = minDepth
while (depth < stretchDepth) {
  var check = 0
  for (i in 1..iterations) {
    check = check + Tree.new(i, depth).check + Tree.new(-i, depth).check
  }

  iterations = iterations / 4
  depth = depth + 2
}

longLivedTree.check