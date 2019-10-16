//: A UIKit based Playground for presenting user interface
  
class MinStack {

    /** initialize your data structure here. */
    fileprivate var array = [Int]()
    fileprivate var minStack = [Int]()
    public init() {}

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    public func push(_ element: Int) {
        array.append(element)
        if minStack.isEmpty {
            minStack.append(element)
        } else if let minV = minStack.last {
            if minV >= element {
                minStack.append(element)
            }
        }
    }

    func pop() {
        if let last = array.last, last == minStack.last {
            minStack.popLast()
        }
        array.popLast()
    }

    func top() -> Int {
        return array.last ?? 0
    }

    func getMin() -> Int {
        if array.isEmpty {
            return 0
        }
        return minStack.last ?? 0
    }
}
/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

let obj = MinStack()
obj.push(2)
obj.push(0)
obj.push(3)
obj.getMin()
obj.pop()
obj.top()
obj.getMin()

let ret_3: Int = obj.top()
let ret_4: Int = obj.getMin()

/*
 6 septiembre 2019
 Runtime: 100 ms, faster than 71.54% of Swift online submissions for Min Stack.
 Memory Usage: 21.6 MB, less than 25.00% of Swift online submissions for Min Stack.
 */
