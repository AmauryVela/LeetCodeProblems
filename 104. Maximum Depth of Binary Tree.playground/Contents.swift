//: Playground - noun: a place where people can play

import UIKit

/*Given a binary tree, find its maximum depth.

The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

Note: A leaf is a node with no children.

Example:

Given binary tree [3,9,20,null,null,15,7],

3
/ \
9  20
/  \
15   7
return its depth = 3.
*/

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

var rootNode = TreeNode(3)
let nineNode = TreeNode(9)
let twentyNode = TreeNode(20)
let fifNode = TreeNode(15)
let sevenNode = TreeNode(7)
rootNode.left = nineNode
twentyNode.left = fifNode
twentyNode.right = sevenNode
rootNode.right = twentyNode


// Recursive Solution
func maxDepth(_ root: TreeNode?) -> Int {
    guard let rootNode = root else { return 0 }
    return 1 + max(maxDepth(root?.left), maxDepth(rootNode.right))
}

maxDepth(rootNode)

// Iterative Solution
func mxDepth(_ root: TreeNode?) -> Int {

}
