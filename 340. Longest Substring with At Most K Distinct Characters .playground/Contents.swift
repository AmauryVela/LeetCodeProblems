//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
    guard !s.isEmpty, k > 0  else {
        return 0
    }
    var s = Array(s)
    var maxLenght = 1
    var l = 0
    var r = 0
    var dic = [Character: Int]()
    while r < s.count {
        let char = s[r]
        dic[char] = r
        r += 1

        if dic.count == k + 1 {
            if let min = dic.min(by: { a, b in a.value < b.value }) {
                dic[min.key] = nil
                l = min.value + 1
            }
        }
        let lenght = r-l
        maxLenght = max(maxLenght, lenght)
    }

    return maxLenght
}

lengthOfLongestSubstringKDistinct("ababffzzeee", 2)

lengthOfLongestSubstringKDistinct("abaccc", 2)


lengthOfLongestSubstringKDistinct("eceba", 0)


lengthOfLongestSubstringKDistinct("eceba", 2)
lengthOfLongestSubstringKDistinct("aa", 1)

/**
 5 oct 19

 Runtime: 40 ms, faster than 70.83% of Swift online submissions for Longest Substring with At Most K Distinct Characters.
 Memory Usage: 23.6 MB, less than 100.00% of Swift online submissions for Longest Substring with At Most K Distinct Characters.
 */
