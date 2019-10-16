//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: CustomDebugStringConvertible {

    public var debugDescription: String {
        // 3
        var text = "["
        // 4
        text += "\(self.val)"
        var next = head.next
        while next != nil {
            text += "\(next?.val)"
            next = next?.next
        }
        // 5
        return text + "]"
    }
}

func deleteDuplicates(_ head: ListNode?) -> ListNode? {

    var ans: ListNode?

    if let head = head {
        var lastV = head.val
        var lastNode = ListNode(lastV)
        ans = lastNode
        var next = head.next
        while next != nil {
            if lastV != next?.val {
                let thisNode = ListNode(next?.val ?? 0)
                lastNode.next = thisNode
                lastNode = thisNode
                lastV = next?.val ?? 0
            }
            next = next?.next
        }
    }
    return ans

}

var head = ListNode(1)
var next1 = ListNode(1)
var last = ListNode(2)

head.next = next1
next1.next = last

let not = deleteDuplicates(head)
print(not)

/**

 Runtime: 32 ms, faster than 41.05% of Swift online submissions for Remove Duplicates from Sorted List.
 Memory Usage: 20.7 MB, less than 50.00% of Swift online submissions for Remove Duplicates from Sorted List.
 */
