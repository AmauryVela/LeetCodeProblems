//: Playground - noun: a place where people can play

import UIKit

/*
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
*/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: CustomStringConvertible {

    public var description: String {
        guard let next = next else {
            return "\(val)"
        }
        return "\(val) -> " + String(describing: next) + " "
    }
}

let n3 = ListNode(3)
let n4 = ListNode(4)
let l1 = ListNode(2)
n4.next = n3
l1.next = n4

let n = ListNode(4)
let n6 = ListNode(6)
let l2 = ListNode(5)
n6.next = n
l2.next = n6

/*

 The following content was create as a brute force solution, I'll keep it for
 lerning my errors

 FBS = ForceBruteSolution
 */
func addTwoNumbersFBS(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

    var resultList: ListNode
    var carryOver: Int?
    let (result, carry) = helperSumFunctionFBS(l1?.val ?? 0, add: l2?.val ?? 0, carryOver: carryOver)
    resultList = ListNode(result)
    carryOver = carry
    var nodeL1 = l1?.next
    var nodeL2 = l2?.next
    var lastNode = resultList
    while nodeL1 != nil {
        let (result, carry) = helperSumFunctionFBS(nodeL1?.val ?? 0, add: nodeL2?.val ?? 0, carryOver: carryOver)
        carryOver = carry
        let newNode = ListNode(result)
        lastNode.next = newNode
        nodeL1 = nodeL1?.next
        nodeL2 = nodeL2?.next
        lastNode = newNode
    }

    if let carry = carryOver {
        lastNode.next = ListNode(carry)
    }

    return resultList
}

func helperSumFunctionFBS(_ val: Int, add: Int, carryOver: Int?) -> (Int, Int?) {
    let sum = val + add + (carryOver ?? 0)
    if sum == 10 {
        return (0, 1)
    } else if sum > 10 {
        return (sum - 10, 1)
    }
    return (sum, nil)
}

addTwoNumbersFBS(l1, l2)
/* WRONG ANSEWR ON
INPUT: [0]
[7,3]
Output:
[7]
Expected:
[7,3]
 */

/* Optimal solution and correct one */

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var resultList: ListNode
    var carryOver = 0
    resultList = ListNode(0)
    var nodeL1 = l1
    var nodeL2 = l2
    var lastNode = resultList
    while nodeL1 != nil || nodeL2 != nil {
        let result = (nodeL1?.val ?? 0) + (nodeL2?.val ?? 0) + carryOver
        carryOver = result/10
        let newNode = ListNode(result % 10)
        lastNode.next = newNode
        nodeL1 = nodeL1?.next
        nodeL2 = nodeL2?.next
        lastNode = newNode
    }

    if carryOver > 0 {
        lastNode.next = ListNode(carryOver)
    }

    return resultList.next
}
addTwoNumbers(l1, l2)
addTwoNumbers(nil, l2)
