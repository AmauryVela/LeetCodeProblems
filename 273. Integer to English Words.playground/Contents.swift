//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

/**
 Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 231 - 1.

 Example 1:

 Input: 123
 Output: "One Hundred Twenty Three"
 Example 2:

 Input: 12345
 Output: "Twelve Thousand Three Hundred Forty Five"
 Example 3:

 Input: 1234567
 Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
 Example 4:

 Input: 1234567891
 Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
 **/

func unitType(_ num: Int) -> String {
    switch num {
    case 1:
        return "Hundred"
    case 2:
        return "Thousand"
    case 3:
        return "Million"
    case 4:
        return "Billion"
    default:
        return ""
    }
}

func hundredSring(_ num: Int, group: String) -> String {
    var ans = ""
    // Hundread
    let hundreadNum = num/100
    guard hundreadNum != 0 else { return "" }
    let hundread = "\(units(hundreadNum)) \(group)"
    ans.append(hundread)
    let tensN = (num - (hundreadNum*100))/10
    if tensN == 1 {
        let tensS = " \(tensTwoDigits((num - (hundreadNum*100))))"
        ans.append(tensS)
        return ans
    } else {
        if tensN > 0 {
            let tensS = " \(tens(tensN))"
            ans.append(tensS)
        }
    }
    let unit = num - (hundreadNum*100) - (tensN*10)
    if unit > 0 {
        let unitS = " \(units(unit))"
        ans.append(unitS)
    }
    return ans
}

func tensTwoDigits(_ num: Int) -> String {
    switch num {
    case 10:
        return "Ten"
    case 11:
        return "Eleven"
    case 12:
        return "Twelve"
    case 13:
        return "Thirteen"
    case 14:
        return "Fourteen"
    case 15:
        return "Fifteen"
    case 16:
        return "Sixteen"
    case 17:
        return "Seventeen"
    case 18:
        return "Eighteen"
    case 19:
        return "Nineteen"
    default:
        return ""
    }
}

func tens(_ num: Int) -> String {
    switch num {
    case 1:
        return "Ten"
    case 2:
        return "Twenty"
    case 3:
        return "Thirty"
    case 4:
        return "Forty"
    case 5:
        return "Fifty"
    case 6:
        return "Sixty"
    case 7:
        return "Seventy"
    case 8:
        return "Eighty"
    case 9:
        return "Ninety"
    default:
        return ""
    }
}


func units(_ num: Int) -> String {
    switch num {
    case 1:
        return "One"
    case 2:
        return "Two"
    case 3:
        return "Three"
    case 4:
        return "Four"
    case 5:
        return "Five"
    case 6:
        return "Six"
    case 7:
        return "Seven"
    case 8:
        return "Eight"
    case 9:
        return "Nine"
    case 10:
        return "Ten"
    default:
        return ""
    }
}

func lessHundread(_ num: Int) -> String {
    var ans = ""
    if num <= 10 {
        return "\(units(num))"
    } else if num > 10 && num < 100 {
        let tensN = num/10
        if tensN == 1 {
            let tensS = "\(tensTwoDigits(num))"
            ans.append(tensS)
            return ans
        } else {
            let tensS = "\(tens(tensN))"
            ans.append(tensS)
        }
        let unit = num - (tensN*10)
        if unit > 0 {
            let unitS = " \(units(unit))"
            ans.append(unitS)
        }
        return ans
    }
    return ans
}

func treeDigits(_ num: Int, type: String) -> String {
    var ans = ""
    ans.append("\(hundredSring(num, group: unitType(1)))")
    return ans
}

func numberToWords(_ num: Int) -> String {
    guard num != 0 else { return "Zero" }
    var ans = ""

    let billion = num / 1000000000;
    let million = (num - billion * 1000000000) / 1000000;
    let thousand = (num - billion * 1000000000 - million * 1000000) / 1000;
    let rest = num - billion * 1000000000 - million * 1000000 - thousand * 1000;

    if billion > 0 {
        if !ans.isEmpty {
            ans.append(" ")
        }
        let ar = Array(String(billion))
        if ar.count == 3 {
            ans.append(treeDigits(billion, type: ""))
        } else {
            ans.append("\(lessHundread(billion))")
        }
        ans.append(" Billion")
    }

    if million > 0 {
        if !ans.isEmpty {
            ans.append(" ")
        }
        let ar = Array(String(million))
        if ar.count == 3 {
            ans.append(treeDigits(million, type: ""))
        } else {
            ans.append("\(lessHundread(million))")
        }
        ans.append(" Million")
    }
    if thousand > 0 {
        if !ans.isEmpty {
            ans.append(" ")
        }
        let ar = Array(String(thousand))
        if ar.count == 3 {
            ans.append(treeDigits(thousand, type: ""))
        } else {
            ans.append("\(lessHundread(thousand))")
        }
        ans.append(" Thousand")
    }

    if rest > 0 {
        if !ans.isEmpty {
            ans.append(" ")
        }
        let ar = Array(String(rest))
        if ar.count == 3 {
            ans.append(treeDigits(rest, type: ""))
        } else {
            ans.append("\(lessHundread(rest))")
        }
    }

    return ans
}
print(numberToWords(50868))

print(numberToWords(50234567891))

print(numberToWords(123))

print(numberToWords(1234567891))

print(numberToWords(12345))


print(numberToWords(22))

print(numberToWords(1000000))




print(numberToWords(1))
print(numberToWords(9))
print(numberToWords(10))
print(numberToWords(1234567))


/**

 October 10 ,19
 Runtime: 12 ms, faster than 85.71% of Swift online submissions for Integer to English Words.
 Memory Usage: 20.9 MB, less than 100.00% of Swift online submissions for Integer to English Words.

 */
