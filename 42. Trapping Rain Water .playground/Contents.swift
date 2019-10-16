//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

func trap(_ height: [Int]) -> Int {

    var wat = 0
    var ans = [[String]]()
    var potencial = 0
    var maxHeight = 0
    for value in height {
        if value == 0 && ans.isEmpty{
            // Ignore
        } else {
            if ans.isEmpty {
                let blocks = Array.init(repeating: "B", count: value)
                ans.append(blocks)
            } else {
                let lastLine = ans.last?.count ?? 0
                if potencial == 0 {
                    potencial = lastLine-value // 1
                    let blocks = Array.init(repeating: "B", count: value)
                    ans.append(blocks)
                } else if potencial > 0 && value > potencial {
                    wat = potencial
                    potencial = 0
                    ans = [[String]]()
                    let blocks = Array.init(repeating: "B", count: value)
                    ans.append(blocks)
                    maxHeight = max(maxHeight, value)
                } else if potencial > 0 && value < potencial {
                    if lastLine+potencial == maxHeight {
                        potencial = potencial + maxHeight
                        ans.append([String]())
                    } else
                }
            }

        }
    }

return 0
}
