//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

/*
 Given a tree of nodes that looks like this:

 A
 / \
 B   G
 / \   \
 C   D   H
 / \
 E   F

 Come up with an algorithm that determines the longest path from each node in the tree.
 */
//: [Next](@next)
enum BinaryTree: CustomStringConvertible {

    case empty
    indirect case node(BinaryTree, String, BinaryTree)

    var description: String {

        switch self {

        case .empty:
            return "empty"
        case .node(_, let string, _):
            return string
        }
    }
    var longestPath: [BinaryTree] {

        switch self {

        case .empty:
            return []

        case .node(let leftBranch, _, let rightBranch):

            let leftPath = leftBranch.longestPath
            let rightPath = rightBranch.longestPath

            if leftPath.count >= rightPath.count {

                return [self] + leftPath
            } else {

                return [self] + rightPath
            }
        }
    }
}

let tree = BinaryTree.node(.node(.node(.node(.empty, "E", .empty), "C", .node(.empty, "F", .empty)), "B", .node(.empty, "D", .empty)), "A", .empty)

print(tree.longestPath)
