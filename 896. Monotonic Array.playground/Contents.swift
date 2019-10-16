//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

func isMonotonic(_ A: [Int]) -> Bool {
    guard !A.isEmpty else {
        return false
    }
    return isMonotonicIncrease(A)||isMonotonicDecrease(A)
}

func isMonotonicIncrease(_ a: [Int]) -> Bool {
    guard !a.isEmpty else {
        return false
    }
    var prev = a[0]
    for i in 1..<a.count {
        if prev <= a[i] {
            prev = a[i]
        } else {
            return false
        }
    }
    return true
}

func isMonotonicDecrease(_ a: [Int]) -> Bool {
    guard !a.isEmpty else {
        return false
    }
    var prev = a[0]
    for i in 1..<a.count {
        if prev >= a[i] {
            prev = a[i]
        } else {
            return false
        }
    }
    return true
}

print(isMonotonic([1,2,2,3]))
print(isMonotonic([1,3,2]))
print(isMonotonic([1,2,4,5]))
print(isMonotonic([1,1,1]))
print(isMonotonic([0,1,0]))

/**

 1 Oct 19
 Runtime: 512 ms, faster than 88.72% of Swift online submissions for Monotonic Array.
 Memory Usage: 21.5 MB, less than 100.00% of Swift online submissions for Monotonic Array.
 */
