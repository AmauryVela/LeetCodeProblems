//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

func reorganizeString(_ S: String) -> String {
    let s = Array(S)
    var dic = [Character: Int]()
    for char in s {
        if let value = dic[char] {
            dic[char] = value + 1
            guard value + 1 <= ((s.count + 1) / 2) else { return "" }
        } else {
            dic[char] = 1
        }

    }
    guard let maxChar = dic.max(by: { a, b in a.value < b.value }) else { return "" }
    print(maxChar.key, maxChar.value)
    var ans = Array.init(repeating: "", count: s.count)

    var i = 0
    for  _ in 0..<maxChar.value {
        ans[i] = String(maxChar.key)
        i += 2
    }
    var lastEmptyIndex = i
    dic[maxChar.key] = nil
    while !dic.isEmpty {
        guard let maxChar = dic.max(by: { a, b in a.value < b.value }) else { break }
        for _ in 1..<maxChar.value+1 {
            if lastEmptyIndex >= s.count {
                lastEmptyIndex = 1
            }
            ans[lastEmptyIndex] = String(maxChar.key)
            lastEmptyIndex += 2

        }
        dic[maxChar.key] = nil
    }
    return String(ans.joined())
}
reorganizeString("eqmeyyyggvp")

reorganizeString("eqmeyggvp")

reorganizeString("blflxll")

reorganizeString("bfrbs")

reorganizeString("vvvlo")



/**
 Example 1

Input: S = "aab"
Output: "aba"*/
reorganizeString("aab") // Output should be aba

reorganizeString("aaab") // Output should be ""

/**
 Runtime: 8 ms, faster than 100.00% of Swift online submissions for Reorganize String.
 Memory Usage: 22.8 MB, less than 100.00% of Swift online submissions for Reorganize String.
*/
