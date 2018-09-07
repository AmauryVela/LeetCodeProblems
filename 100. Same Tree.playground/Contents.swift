//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*Given two binary trees, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

Example 1:

Input:
  1         1
 / \       / \
2   3     2   3

[1,2,3],   [1,2,3]

Output: true
Example 2:

Input:
  1         1
 /           \
2             2

[1,2],     [1,null,2]

Output: false
Example 3:

Input:
  1         1
 / \       / \
2   1     1   2

[1,2,1],   [1,1,2]

Output: false*/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
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


let twoNode = TreeNode(2)
let threeNode = TreeNode(3)
let oneNode = TreeNode(1)

oneNode.left = twoNode
oneNode.right = threeNode

let firstTree = oneNode
let secondTree = oneNode
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil { return true }
    guard let headP = p, let headQ = q else { return false }
    if headP.val != headQ.val { return false }
    return isSameTree(headP.left, headQ.left) && isSameTree(headP.right, headQ.right)
}

print(isSameTree(firstTree, secondTree))
