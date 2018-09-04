//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 Given a list of number 8 4 3 0 6 4 0, move all 0's to start of the list. use minimum sorting rounds
 */

let input = [8,4,3,0,6,4,0]

func moveAllZero(_ array: Array<Int> ) -> Array<Int> {

    // First Solution
    /*let arrayNonZero = array.filter { $0 > 0 }
    let zeroArray = array.filter { $0 == 0 }
    return arrayNonZero + zeroArray*/

    let arrayNonZero = array.filter { $0 > 0 }
    let zeroArray = Array(repeatElement(0, count: array.count - arrayNonZero.count))
    return arrayNonZero + zeroArray
}

moveAllZero(input)



var inputx = [8,4,3,0,6,4,0]

func moveAllZeroToEnd(_ array: inout Array<Int> ) -> Int {
    var count = 0
    for i in array {
        if i == 0 {
            count+=1
        }
    }
    array = array.filter { $0 != 0 }
    array = array + Array(repeatElement(0, count: count))
    return count
}
moveAllZeroToEnd(&inputx)

var test = [0,1,0,3,12]
moveAllZeroToEnd(&test)
test


func lengthOfLongestSubstring(_ s: String) -> Int {

    var characterDict = [Character:Int]()
    var maxLength = 0
    var lastRepeatPos = -1
   // var i = 0

    for (i, c) in s.enumerated() {
        print(characterDict)
        print("characterDict[c]", characterDict[c], "characterDict[c]! > lastRepeatPos",lastRepeatPos)
        if (characterDict[c] != nil) && (characterDict[c]! > lastRepeatPos) {
            lastRepeatPos = characterDict[c]!
        }

        maxLength = max(i - lastRepeatPos, maxLength)
        print("MX",maxLength)
        characterDict[c] = i
        print("characterDict[c] = i",characterDict[c])
       // i += 1
    }

    return maxLength
}

lengthOfLongestSubstring("abcabcbb")
