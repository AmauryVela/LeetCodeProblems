//: Playground - noun: a place where people can play

import UIKit

/*

 1. Two Sum


Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
*/

func twoSum(_ nums: [Int], _ target: Int) -> [Int]? {
    // This function runs at O(n^2) because of this 2 nested arrays
    for (i, value) in nums.enumerated() {
        for (j, secondValue) in nums.enumerated() {
            if value + secondValue == target {
                return [i, j]
            }
        }
    }
    return nil
}

func twoSumOptimized(_ nums: [Int], _ target: Int) -> [Int]? {
    // This function runs at O(n)
    var map = [Int: Int]()
    for (i, value) in nums.enumerated() {
        if let secondValue = map[value] {
            return [secondValue, i]
        } else {
            map[target - value] = i
            print(target-value, i)
        }
    }
    return nil
}

//let exampleData = [2, 7, 11, 15]
let exampleData = [6, 7, 11, 2]

let indices = twoSum(exampleData, 9)

let optimizedIndices = twoSumOptimized(exampleData, 9)
