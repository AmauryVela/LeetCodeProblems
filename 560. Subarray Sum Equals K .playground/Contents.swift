//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var count = 0
    for s in 0..<nums.count {
        var sum = 0
        print("s",sum,s)
        for e in s..<nums.count{
            sum += nums[e]
            print("e",e, nums[e], "s", sum)
            if sum == k {
                print("H")
                count += 1
            }
        }
    }
    return count
}

//Input:nums = [1,1,1], k = 2
print(subarraySum([1,1,1], 2))
