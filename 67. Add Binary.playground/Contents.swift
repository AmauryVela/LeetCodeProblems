//: A UIKit based Playground for presenting user interface
  
func addBinary(_ a: String, _ b: String) -> String {
    var graterString: String
    var lowerString: String

    if a.count > b.count {
        graterString = a
        lowerString = b
    } else {
        lowerString = a
        graterString = b
    }

    let aReversed = Array(graterString.reversed())
    var bReversed = Array(lowerString.reversed())
    var ans = [Character]()
    var carry = 0

    for (index, c) in aReversed.enumerated() {
        if index < bReversed.count {
            let value = (Int(String(c)) ?? 0) + (Int(String(bReversed[index])) ?? 0) + carry
            if value % 2 == 0 {
                ans.append("0")
            } else {
                ans.append("1")
            }
            carry = value/2
        } else {
            let value = (Int(String(c)) ?? 0) + carry
            if value % 2 == 0 {
                ans.append("0")
            } else {
                ans.append("1")
            }
            carry = value/2
        }
    }

    if carry != 0 {
        ans.append("1")
    }
    return String(ans.reversed())
}
print(addBinary("1111", "1111")) // Expected: "11110"


print(addBinary("11", "1"))



print(addBinary("0", "0"))
print(addBinary("1010", "1011")) // Expected: 10101

/**
 29 sept 2019
 Runtime: 20 ms, faster than 41.96% of Swift online submissions for Add Binary.
 Memory Usage: 21.9 MB, less than 16.67% of Swift online submissions for Add Binary.
 */
