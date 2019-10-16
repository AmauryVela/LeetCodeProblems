//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

func productExceptSelf(_ nums: [Int]) -> [Int] {
    var leftA = [1]
    var rightA = [1]

    for i in 0..<nums.count {
        let val = nums[i] * (leftA.last ?? 0)
        leftA.append(val)
    }

    for i in stride(from: nums.count - 1, to: 0, by: -1) {
        let val = nums[i] * (rightA.last ?? 0)
        rightA.append(val)
    }

    var ans = [Int]()
    var index = rightA.count - 1
    for i in 0..<nums.count {
        ans.append(leftA[i]*rightA[index])
        index -= 1
    }

    return ans
}

/**
 Example:

 Input:  [1,2,3,4]
 Output: [24,12,8,6]
 */
productExceptSelf([1,2,3,4]) // [24,12,8,6]

/**
 Runtime: 116 ms, faster than 29.74% of Swift online submissions for Product of Array Except Self.
 Memory Usage: 23.9 MB, less than 100.00% of Swift online submissions for Product of Array Except Self.
 */
