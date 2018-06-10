//: Playground - noun: a place where people can play

import UIKit

/*
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

 Note: For the purpose of this problem, we define empty string as valid palindrome.

 Example 1:

 Input: "A man, a plan, a canal: Panama"
 Output: true
 Example 2:

 Input: "race a car"
 Output: false
*/

/*func isPalindrome(_ s: String) -> Bool {
    guard !s.isEmpty else { return true }

    let componentsString = s.components(separatedBy: CharacterSet.alphanumerics.inverted).joined(separator: "")
    print(componentsString)

    let stringLower = componentsString.lowercased()
    let reversed = String(stringLower.reversed())

    if stringLower  == reversed {
        return true
    }
    return false
}*/

func isPalindrome(_ s: String) -> Bool {
    let componentsString = s.components(separatedBy: CharacterSet.alphanumerics.inverted).joined(separator: "").lowercased()
    return componentsString == String(componentsString.reversed())
 }

let first = "A man, a plan, a canal: Panama"
isPalindrome(first)

let second = "race a car"
isPalindrome(second)

let edgeCase = ""
isPalindrome(edgeCase)

let thr  = "Ana, ana:ana ana"
isPalindrome(thr)

