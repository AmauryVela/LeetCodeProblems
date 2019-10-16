//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

func isOneEditDistance(_ s: String, _ t: String) -> Bool {
    if s.isEmpty && t.isEmpty { return false }
    if s.isEmpty && t.count == 1 { return true }
    if t.isEmpty && s.count == 1 { return true }

    let s = Array(s)
    let t = Array(t)

    if s == t {
        return false
    } else if (s.count - t.count) >= 2 || (s.count - t.count) <= -2{
        // This case if to check if the new string is less than 2 values, this means its not one digit apart, even if the new string has the characters there was 2 deletions.
        return false
    }

    var l = -1
    var r = -1
    while (l < s.count && r < t.count) {
        l += 1
        r += 1
        guard l < s.count, r < t.count  else { break }

        print("\(l) < \(s.count) \(l < s.count)")
        print("\(r) < \(t.count) \(r < t.count)")

        print(l)
        print(r)
        if s[l] != t[r] {
            if s.count == t.count {
                var editedT = t
                editedT[r] = s[l]

                var editedS = s
                editedS[l] = t[r]
                return isOneEditDistanceHelper(s, t: editedT, l: l, r: r) || isOneEditDistanceHelper(editedS, t: t, l: l, r: r)
            } else {
                return isOneEditDistanceHelper(s, t: t, l: l, r: r+1) || isOneEditDistanceHelper(s, t: t, l: l+1, r: r)
            }
        }
    }

    return true
}

func isOneEditDistanceHelper(_ s: Array<Character>, t: Array<Character>, l: Int, r: Int) -> Bool{
    guard l < s.count, r < t.count  else { return false }
    var right = r
    var left = l

    while (left < s.count || right < t.count ) {
        print("\(s[left]):\(left) < \(s.count)")
        print("\(t[right]):\(right) < \(t.count) ")
        if s[left] != t[right] {
            return false
        }
        left+=1
        right+=1
    }
    return true
}
print(isOneEditDistance("a", "ac"))

print(isOneEditDistance("", ""))
print(isOneEditDistance("", "1"))

print(isOneEditDistance("1203", "1213"))


print(isOneEditDistance("ab", "acb"))
print(isOneEditDistance("cab", "ad"))

print(isOneEditDistance("teacher", "teacherly"))

/**
1 oct 19
 boooooh xD bad really bad algorithm

 Runtime: 28 ms, faster than 19.61% of Swift online submissions for One Edit Distance.
 Memory Usage: 21.7 MB, less than 100.00% of Swift online submissions for One Edit Distance.

 */

/**

Forgot to remove prints on leetcode submission so the real

 Runtime: 8 ms, faster than 92.16% of Swift online submissions for One Edit Distance.
 Memory Usage: 20.8 MB, less than 100.00% of Swift online submissions for One Edit Distance.

 92.16% not bad :D
 */
