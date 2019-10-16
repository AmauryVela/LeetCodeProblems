//: A UIKit based Playground for presenting user interface
import Foundation

func compareVersion(_ version1: String, _ version2: String) -> Int {
    if version1.count == version2.count, let v1 = Int(version1), let v2 = Int(version2), v1 > v2 {
        return 1
    } else if version1.count == version2.count, let v1 = Int(version1), let v2 = Int(version2), v1 < v2 {
        return -1
    }

    var componentsV1 = version1.components(separatedBy: ".").compactMap {  Int($0) ?? 0 }
    var componentsV2 = version2.components(separatedBy: ".").compactMap { Int($0) ?? 0 }

    let c1 = Array(componentsV1.reversed())

    for c in c1 {
        if c != 0 {
            break
        } else {
            componentsV1.removeLast()
        }
    }
    let c2 = Array(componentsV2.reversed())

    for c in c2 {
        if c != 0 {
            break
        } else {
            componentsV2.removeLast()
        }
    }

    if componentsV1 == componentsV2 {
        return 0
    } else if let first1 = componentsV1.first, let first2 = componentsV2.first, first1 > first2 {
        return 1
    } else if let first1 = componentsV1.first, let first2 = componentsV2.first, first1 < first2 {
        return -1
    }
    print(componentsV1.count)
    print(componentsV2.count)

    if componentsV1.count < componentsV2.count {
        // Last component
        if let last = componentsV1.last {
            if last > componentsV2[componentsV1.count-1] {
                return 1
            } else if (last == componentsV2[componentsV1.count-1] && componentsV2[componentsV1.count] > 0 ) || (componentsV2[componentsV2.count-1]>0) {
                return -1
            }
        }
    }
    var indexV2 = 0
    var final = 0
    for component in componentsV1 {
        if indexV2 >= componentsV2.count {
            return 1
        }
        if component > componentsV2[indexV2] {
            indexV2 += 1
            final = 1
        } else if component == componentsV2[indexV2] {
            indexV2 += 1
            final = 0
        } else {
            return -1
        }
    }

    if final == 1 && indexV2 < componentsV2.count {
        return -1
    }
    return final
}
compareVersion("1.0", "1") // 0

compareVersion("1", "1.0.1") // -1

compareVersion("1", "1.1") // -1

compareVersion("1.0", "1.0.0") // 0

compareVersion("0.1", "0.0.1") // 1



compareVersion("1.0", "0.1") //1
compareVersion("0.1", "1.1") // -1
compareVersion("1", "0") // 1

compareVersion("1.0.1", "1") //1
compareVersion("7.5.2.4", "7.5.3") // -1
compareVersion("1.01", "1.001") // 0

/**
 1 oct 2019
 Runtime: 4 ms, faster than 94.64% of Swift online submissions for Compare Version Numbers.
 Memory Usage: 23.1 MB, less than 100.00% of Swift online submissions for Compare Version Numbers.
 */
