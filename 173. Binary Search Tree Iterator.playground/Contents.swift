
/*:

 **173. Binary Search Tree Iterator**

 Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.

 Calling next() will return the next smallest number in the BST.

![alt text](https://assets.leetcode.com/uploads/2018/12/25/bst-tree.png "Logo Title Text 1")

![Xcode icon](http://devimages.apple.com.edgekey.net/assets/elements/icons/128x128/xcode.png "Some hover text")
 ````
 BSTIterator iterator = new BSTIterator(root);
 iterator.next();    // return 3
 iterator.next();    // return 7
 iterator.hasNext(); // return true
 iterator.next();    // return 9
 iterator.hasNext(); // return true
 iterator.next();    // return 15
 iterator.hasNext(); // return true
 iterator.next();    // return 20
 iterator.hasNext(); // return false
 ````

 **Note:**
 - next() and hasNext() should run in average O(1) time and uses O(h) memory, where h is the height of the tree.
 - You may assume that next() call will always be valid, that is, there will be at least a next smallest number in the BST when next() is called.

 */

/// Definition for a binary tree node.
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

extension TreeNode {
    public func traverseInOrder(process: (Int) -> Void) {
        left?.traverseInOrder(process: process)
        process(val)
        right?.traverseInOrder(process: process)
    }
}

class BSTIterator {
    var array = [Int]()
    var index = -1

    init(_ root: TreeNode?) {
        root?.traverseInOrder(process: { array.append($0) })
    }

    /** @return the next smallest number */
    func next() -> Int {
        guard !array.isEmpty else {
            return 0
        }
        index += 1
        return array[index]
    }

    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        print(index)
        print(array.count)
        return index+1 < array.count
    }
}

// Test with no leafs
/*let badRoot = TreeNode(7)
let badIterator = BSTIterator(badRoot)
badIterator.hasNext()*/

let badRoot2 = TreeNode(3)
let one = TreeNode(1)
one.right = TreeNode(2)
badRoot2.left = one
badRoot2.right = TreeNode(4)
let badIterator2 = BSTIterator(badRoot2)
badIterator2.hasNext()
badIterator2.next()
badIterator2.hasNext()
badIterator2.next()
badIterator2.hasNext()
badIterator2.next()
badIterator2.hasNext()
badIterator2.next()



let root = TreeNode(7)
root.left = TreeNode(3)
let r = TreeNode(15)
root.right = r
r.left = TreeNode(9)
r.right = TreeNode(20)


let iterator = BSTIterator(root)
iterator.next()    // return 3
iterator.next()    // return 7
iterator.hasNext() // return true
iterator.next()    // return 9
iterator.hasNext() // return true
iterator.next()    // return 15
iterator.hasNext() // return true
iterator.next()    // return 20
iterator.hasNext() // return false)

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
