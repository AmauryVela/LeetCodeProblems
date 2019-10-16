//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

func canPermutePalindrome(_ s: String) -> Bool {
    if s == String(s.reversed()) {
        return true
    }

    var dic = [Character: Int]()
    for char in s {
        if let value = dic[char] {
            dic[char] = value + 1
        } else {
            // Add new char
            dic[char] = 1
        }
    }

    // Check how many of this are in order to know if is a permutatioon
    var foundOne = false
    for (_ , value) in dic {
        if value % 2 == 1 {
            if foundOne {
                return  false
            }
            foundOne = true
        }
    }

    return true
}

let input1 = "code"

canPermutePalindrome(input1)


/**
 24 sept 2019
 Runtime: 4 ms, faster than 83.33% of Swift online submissions for Palindrome Permutation.
 Memory Usage: 21.5 MB, less than 100.00% of Swift online submissions for Palindrome Permutation.
 */
