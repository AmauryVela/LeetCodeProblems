//: Playground - noun: a place where people can play

import UIKit

var str = "a#bc#"
var t = "a#b"
func backspaceCompare(_ S: String, _ T: String) -> Bool {
    return backspaceHelper(S) == backspaceHelper(T)
}

func backspaceHelper(_ s: String) -> String {

    let array = Array(s)
    var newArray = Array<Character>()
    for c in array {
        if c != "#" {
            newArray.append(c)

        } else  if !newArray.isEmpty{
            newArray.removeLast()
        }
    }
    return String(newArray)
}

backspaceCompare(str, t)

