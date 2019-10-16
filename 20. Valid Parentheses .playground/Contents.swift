//: A UIKit based Playground for presenting user interface

/*:
Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Note that an empty string is also considered valid.

Example 1:

Input: "()"
Output: true
Example 2:

Input: "()[]{}"
Output: true
Example 3:

Input: "(]"
Output: false
Example 4:

Input: "([)]"
Output: false
Example 5:

Input: "{[]}"
Output: true
*/

public struct Stack<T> {
    fileprivate var array = [T]()

    public init() {}

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    public mutating func push(_ element: T) {
        array.append(element)
    }

    public mutating func pop(_ element: T) -> T? {
        return array.popLast()
    }

    public var top: T? {
        return array.last
    }
}

enum opener: String {
    case openBraket = "{"
    case openSquareBraket = "["
    case openParentesis = "("

    func opposite() -> closer {
        switch self {
        case .openBraket:
            return .closeBraket
        case .openSquareBraket:
            return .closeSquareBraket
        case .openParentesis:
            return .closeParentesis
        }

    }
}

enum closer: String {
    case closeBraket = "}"
    case closeSquareBraket = "]"
    case closeParentesis = ")"
}

extension String {

    func isCodeValid() -> Bool {
        if self.count == 0 {
            return true
        }

        guard self.count % 2 == 0 else {
            return false
        }
        var stack = Stack<String>()

        for c in self {
            if opener(rawValue: String(c)) != nil {
                // We are abele to create a opener by the c, meaning its an opener
                stack.push(String(c))
            } else if let closer = closer(rawValue: String(c)) {
                if stack.isEmpty {
                    return false
                }
                if let lastOpener = opener(rawValue: (stack.top ?? "")) {
                    if closer == lastOpener.opposite() {
                        stack.pop(stack.top!)
                    } else {
                        return false
                    }
                }
            }
        }
        return stack.isEmpty
    }
}

let test1 = "{ [ ] ( ) }".isCodeValid()
let test2 = "{ [ ( ] ) }".isCodeValid()
let test3 = "{ [ }".isCodeValid()

let test4 = "(}[])".isCodeValid()

class Solution {
    /*
     6 september 2019 
     Runtime: 8 ms, faster than 75.74% of Swift online submissions for Valid Parentheses.
     Memory Usage: 20.8 MB, less than 14.29% of Swift online submissions for Valid Parentheses.
     */
    func isValid(_ s: String) -> Bool {
        return s.isCodeValid()
    }
}
