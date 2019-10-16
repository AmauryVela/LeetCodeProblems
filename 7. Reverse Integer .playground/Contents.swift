//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

func reverse(_ x: Int) -> Int {
    var ans = 0
    var x = x
    while x != 0 {
        ans = ans * 10 + x % 10
        x = x/10
    }
    if ans < Int32.min || ans > Int32.max { return 0 }
    return ans
}



/**
 8 oct 19
 Runtime: 8 ms, faster than 75.37% of Swift online submissions for Reverse Integer.
 Memory Usage: 20.6 MB, less than 9.09% of Swift online submissions for Reverse Integer.

 */
