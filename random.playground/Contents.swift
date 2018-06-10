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
