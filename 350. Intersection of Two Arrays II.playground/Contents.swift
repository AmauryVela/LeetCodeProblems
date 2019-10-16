//: A UIKit based Playground for presenting user interface
  
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var largest = [Int]()
    var smallest = [Int]()
    var ans = [Int]()

    if nums1.count < nums2.count {
        largest = nums2
        smallest = nums1
    } else {
        largest = nums1
        smallest = nums2
    }


    var dic = [Int: Int]()
    for num in smallest {
        if let numDic = dic[num] {
            dic[num] = numDic+1
        } else {
            dic[num] = 1
        }
    }

    for num in largest {
        if let numInDic = dic[num] {
            // Means there is
            ans.append(num)
            if (numInDic - 1) > 0 {
                dic[num] = numInDic - 1
            } else {
                dic[num] = nil
            }
        }
    }

    return ans
}

let nums5 = [-2147483648,1,2,3]
let nums6 = [1,-2147483648,-2147483648]
intersect(nums5, nums6)

let nums3 = [4,9,5]
let nums4 = [9,4,9,8,4]
intersect(nums3, nums4)

let nums1 = [2,2]
let nums2 = [1,2,2,1]
intersect(nums1, nums2)


/**
 5 oct 19
 Runtime: 28 ms, faster than 73.21% of Swift online submissions for Intersection of Two Arrays II.
 Memory Usage: 21 MB, less than 20.00% of Swift online submissions for Intersection of Two Arrays II.
 */
