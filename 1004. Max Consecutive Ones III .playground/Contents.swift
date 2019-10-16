//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

func longestOnes(_ A: [Int], _ K: Int) -> Int {
    guard  K > 0 else { return 0 }
    var zeroArray = [Int]()
    var lastMax = 0
    var maxV = 0
    for (i, value) in A.enumerated() {
        if value == 0 {
            if zeroArray.count < K {
                zeroArray.append(i)
                maxV += 1
            }
            else {
                maxV = i  - zeroArray.removeFirst()
                zeroArray.append(i)
            }
        }
        else {
            maxV += 1
        }
        lastMax = max(lastMax, maxV)
    }
    return lastMax
}

let A = [1,1,1,0,0,0,1,1,1,1,0]
let B = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1]
longestOnes(B, 3)
print(A.indices)
