//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

     1
    / \
   2   2
  / \ / \
 3  4 4  3
 But the following [1,2,2,null,3,null,3] is not:
  1
 / \
 2   2
  \   \
  3    3
 Note:
 Bonus points if you could solve it both recursively and iteratively.
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func isSymmetric(_ root: TreeNode?) -> Bool {
    guard let rootNode = root else { return true }
    if root?.left == nil && root?.right == nil { return true }
    else if rootNode.left?.val == rootNode.right?.val {
        return isSymetric(rootNode.left, rootNode.right)
    } else {
        return false
    }
}

func isSymetric(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
        return true
    } else if p?.left?.val != q?.right?.val || p?.right?.val != q?.left?.val {
        return false
    }
    return isSymetric(p?.left, q?.right) && isSymetric(p?.right, q?.left)
}
