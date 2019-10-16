//: A UIKit based Playground for presenting user interface
  
/*:

 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Example:

 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Follow up:

 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.


 */

func maxSubArray(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    if nums.count == 1 {
        return nums.first ?? 0
    }

    var maxSum = nums.first ?? 0
    var sum = nums.first ?? 0

    for num in nums {
        sum = max(sum + num, num)
        if sum > maxSum {
            maxSum = sum
        }
    }
    return maxSum
}

maxSubArray([8,-19,5,-4,20])

maxSubArray([-2,1])

let input = [-2,1,-3,4,-1,2,1,-5,4]
maxSubArray(input)

/**
 3 sep 2019
 Runtime: 52 ms, faster than 17.84% of Swift online submissions for Maximum Subarray.
 Memory Usage: 20.8 MB, less than 16.67% of Swift online submissions for Maximum Subarray.
 */



