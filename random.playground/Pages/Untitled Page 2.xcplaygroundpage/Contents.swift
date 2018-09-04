//: [Previous](@previous)

import Foundation


enum LinkedList<T> {

    case empty
    indirect case node(T, LinkedList)

    func swapTwoFirst() -> LinkedList {

        switch self {
        case .node(let value, .node(let nextValue, let next)):
            return .node(nextValue, .node(value, next.swapTwoFirst()))
        case .empty:
            return .empty
        case .node(let value, .empty):
            return .node(value, .empty)
        }
    }
}

let list = LinkedList.node(1, LinkedList.node(2, LinkedList.node(3, LinkedList.node(4, LinkedList.node(5, LinkedList.empty)))))

list.swapTwoFirst()
print(list.swapTwoFirst())
