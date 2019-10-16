//: A UIKit based Playground for presenting user interface
  
func addStrings(_ num1: String, _ num2: String) -> String {
    if num1.isEmpty {
        return num2
    } else if num2.isEmpty {
        return num1
    }

    var firstArray = String(num1.reversed())
    var secondArray = String(num2.reversed())

    if firstArray.count > secondArray.count {
        let diff = firstArray.count - secondArray.count
        let arrrayOfDiff = Array.init(repeating: "0", count: diff)
        secondArray.append(arrrayOfDiff.joined())
    } else if firstArray.count < secondArray.count {
        let diff = secondArray.count - firstArray.count
        let arrrayOfDiff = Array.init(repeating: "0", count: diff)
        firstArray.append(arrrayOfDiff.joined())
    }
    return sumIntInArray(String(firstArray).toArrayInt(), String(secondArray).toArrayInt())
}

// This function will assume that num1 is greater and reversed
func sumIntInArray(_ num1: [Int], _ num2: [Int]) -> String {
    print(num1)
    print(num2)
    var ans = String()
    var bucket = 0
    for i in 0..<num1.count {
        let first = num1[i]
        let second = num2[i]

        let digitAns = first + second + bucket
        ans.append(String(digitAns%10))
        bucket = digitAns/10
    }
    if bucket != 0 {
        ans.append(String(bucket))
    }
    return String(ans.reversed())
}
extension String {
    func toArrayInt() -> [Int] {
        var ans = [Int]()
        for c in self {
            ans.append(integerValue(c))
        }
        return ans
    }

    func integerValue(_ string: Character) -> Int {
        switch string {
        case "0":
            return 0
        case "1":
            return 1
        case "2":
            return 2
        case "3":
            return 3
        case "4":
            return 4
        case "5":
            return 5
        case "6":
            return 6
        case "7":
            return 7
        case "8":
            return 8
        case "9":
            return 9
        default:
            return 0
        }
    }

}
addStrings("9", "9")

addStrings("9999", "1")

addStrings("9", "1")

addStrings("499", "1")


addStrings("0", "0")

/**
 3 oct 2019
 Runtime: 32 ms, faster than 55.88% of Swift online submissions for Add Strings.
 Memory Usage: 21.3 MB, less than 100.00% of Swift online submissions for Add Strings.
*/
