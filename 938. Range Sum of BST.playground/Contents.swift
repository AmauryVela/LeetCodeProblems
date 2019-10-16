//: A UIKit based Playground for presenting user interface




public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?

    public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
    }

    public func traverseInOrder(process: (Int) -> Void) {
        left?.traverseInOrder(process: process)
        process(val)
        right?.traverseInOrder(process: process)
    }
}

class Solution {
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        var sum = 0
        let range = L...R

        root?.traverseInOrder (process: { (val) in
            if range ~= val {
                sum = sum + val
            }
        })
        return sum
    }
}

/**
 23 sep 2019
 Runtime: 544 ms, faster than 56.00% of Swift online submissions for Range Sum of BST.
 Memory Usage: 22.3 MB, less than 6.67% of Swift online submissions for Range Sum of BST.

 */
