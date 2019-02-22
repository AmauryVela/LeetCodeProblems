//: Playground - noun: a place where people can play

import UIKit
/*
https://leetcode.com/problems/my-calendar-i/description/
 Implement a MyCalendar class to store your events. A new event can be added if adding the event will not cause a double booking.

 Your class will have the method, book(int start, int end). Formally, this represents a booking on the half open interval [start, end), the range of real numbers x such that start <= x < end.

 A double booking happens when two events have some non-empty intersection (ie., there is some time that is common to both events.)

 For each call to the method MyCalendar.book, return true if the event can be added to the calendar successfully without causing a double booking. Otherwise, return false and do not add the event to the calendar.

 Your class will be called like this: MyCalendar cal = new MyCalendar(); MyCalendar.book(start, end)
 Example 1:
 MyCalendar();
 MyCalendar.book(10, 20); // returns true
 MyCalendar.book(15, 25); // returns false
 MyCalendar.book(20, 30); // returns true
 Explanation:
 The first event can be booked.  The second can't because time 15 is already booked by another event.
 The third event can be booked, as the first event takes every time less than 20, but not including 20.
 Note:

 The number of calls to MyCalendar.book per test case will be at most 1000.
 In calls to MyCalendar.book(start, end), start and end are integers in the range [0, 10^9].
*/

// TreeNode Class
public class TreeNode {
    public var start: Int
    public var end: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
        self.left = nil
        self.right = nil
    }

    public func insert( treeNode: TreeNode) -> Bool {
        if treeNode.start >= self.end {
            guard let right = self.right else {
                self.right = treeNode
                return true
            }
            return right.insert(treeNode: treeNode)
        } else if treeNode.end <= self.start {
            guard let left = self.left else {
                self.left = treeNode
                return true
            }
            return left.insert(treeNode: treeNode)
        }

        return false
    }
}

extension TreeNode: CustomStringConvertible {

    public var description: String {
        return diagram(for: self)
    }

    private func diagram(for node: TreeNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.start)-\(node.end)\n"
        }
        return diagram(for: node.right,
                       top + " ", top + "┌──", top + "│ ")
            + root + "\(node.start)-\(node.end)\n"
            + diagram(for: node.left,
                      bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

var calendarEvents: TreeNode?

func bookOnCalendar(event: TreeNode) -> Bool {
    guard let calendar = calendarEvents else {
        calendarEvents = event
        return true
    }
    return calendar.insert(treeNode: event)
}

let lunch = TreeNode(10, 20)
let meeting = TreeNode(15, 25)
let work = TreeNode(20, 30)
let sleep = TreeNode(5,10)
let deepSlep = TreeNode(2,3)
let deepSlep2 = TreeNode(1,2)
let deepSlep3 = TreeNode(4,5)

print(bookOnCalendar(event: lunch))
print(bookOnCalendar(event: meeting))
print(bookOnCalendar(event: work))
print(bookOnCalendar(event: sleep))
print(bookOnCalendar(event: deepSlep))
print(bookOnCalendar(event: deepSlep2))
print(bookOnCalendar(event: deepSlep3))
print(calendarEvents ?? "")
