//: A UIKit based Playground for presenting user interface
/*:
 Given a collection of intervals, merge all overlapping intervals.

 **Example 1:**

 **Input:** [[1,3],[2,6],[8,10],[15,18]]
 **Output:** [[1,6],[8,10],[15,18]]
 **Explanation:** Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].

** Example 2:**

 **Input:** [[1,4],[4,5]]
 **Output:** [[1,5]]
 **Explanation:** Intervals [1,4] and [4,5] are considered overlapping.
 **NOTE:** input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.

 */
 
func merge(_ intervals: [[Int]]) -> [[Int]] {
    var mergedIntervals = [[Int]]()
    guard !intervals.isEmpty else { return mergedIntervals }
    var intervals = intervals.sorted(by:{ $0[0] < $1[0] })
    mergedIntervals.append(intervals[0])

    for index in 1..<intervals.count {
        let interval = intervals[index]
        let lastKnown = mergedIntervals.last!

        let intervalRange = interval[0]...interval[1]
        let lastRange = lastKnown[0]...lastKnown[1]
        if intervalRange.overlaps(lastRange) {
            var mergedInterval = [Int]()
            let maxV = max(interval[1],lastKnown[1])
            let minV = min(interval[0],lastKnown[0])
            mergedInterval.append(minV)
            mergedInterval.append(maxV)
            mergedIntervals.removeLast()
            mergedIntervals.append(mergedInterval)
        } else {
            mergedIntervals.append(interval)
        }
    }

    return mergedIntervals
}


let input = [[1,3],[2,6],[8,10],[15,18]]
let input2 = [[1,3],[3,6]]
let inputN = [[2,3],[4,5],[6,7],[8,9],[1,10]]

merge(input)
merge(input2)
merge(inputN)

/*:
 **BRUTE FORCE**

 TODAY 21 SEP

Runtime: 96 ms, faster than 55.61% of Swift online submissions for Merge Intervals.
    Memory Usage: 21.4 MB, less than 16.67% of Swift online submissions for Merge Intervals.

*/


/**

 Facebook variant

 https://leetcode.com/discuss/interview-question/338948/Facebook-or-Onsite-or-Schedule-of-Tasks


 IN ORDER, no need to order again
 */
func intersectionAndMergedIntervals(_ intervals: [[Int]]) -> ([[Int]], [[Int]]) {
    var mergedIntervals = [[Int]]()
    var intersection = [[Int]]()
    guard !intervals.isEmpty else { return (intersection, mergedIntervals) }
    var intervals = intervals
    mergedIntervals.append(intervals[0])
    for index in 1..<intervals.count {
        let interval = intervals[index]
        let lastKnown = mergedIntervals.last!

        let intervalRange = interval[0]...interval[1]
        let lastRange = lastKnown[0]...lastKnown[1]
        if intervalRange.overlaps(lastRange) {
            if interval[0] != lastKnown[1]{
                intersection.append([interval[0],min(interval[1],lastKnown[1])])
            }
            mergedIntervals.removeLast()
            mergedIntervals.append([lastKnown[0],max(interval[1],lastKnown[1])])
        } else {
            mergedIntervals.append(interval)
        }
    }
    return (intersection, mergedIntervals)
}

let fb = [[1, 10], [2, 6], [9, 12], [14, 16], [16, 17]]

print(intersectionAndMergedIntervals(fb))

print(intersectionAndMergedIntervals([[1, 10]]))
