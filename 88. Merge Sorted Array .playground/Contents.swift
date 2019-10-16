//: A UIKit based Playground for presenting user interface
  
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

    nums1.removeSubrange(m..<nums1.count)
    var i = 0
    var j = 0
    var bucket = [Int]()

    while i<m, j<n {
        let num1 = nums1[i]
        let num2 = nums2[j]
        if num1 > num2 {
            print("Before: \(nums1) withBucket: \(bucket)")

            nums1[i] = num2
            print("After: \(nums1) withBucket: \(bucket)")
            j += 1
            bucket.append(max(num1, num2))
            i += 1
            continue
        }

        if !bucket.isEmpty && i > 0 {
            if i+1 < nums1.count {
                print("\(i):\(nums1[i]) from \(nums1) withBucket: \(bucket)")
                let thisBucket = bucket.first ?? 0
                if nums1[i] <= thisBucket {
                    let newBucket = nums1[i+1]
                    nums1[i+1] = bucket.removeFirst()
                    bucket.append(newBucket)
                    i += 1
                } else {
                    let newBucket = nums1[i]
                    nums1[i] = bucket.removeFirst()
                    bucket.append(newBucket)
                }
                print("Finish: \(nums1) withBucket: \(bucket)")
            }
        }
        i += 1
    }
    print("Extra: \(nums1) withBucket: \(bucket)")
    if !bucket.isEmpty && j < nums2.count {
        var new = Array(nums2[j..<nums2.count])
        print("Merge: \(new) withBucket: \(bucket)")
        merge(&new, new.count, bucket, bucket.count)
        //nums1.append(contentsOf: new)
        merge(&nums1, nums1.count, new, new.count)

    } else {
        if !bucket.isEmpty {
            merge(&nums1, nums1.count, bucket, bucket.count)
        }
        if j < nums2.count {
            nums1.append(contentsOf: nums2[j..<nums2.count])
        }
    }
}

var nums1E = [0,1,2,8,0,0]
var nums2E = [0,2]
merge(&nums1E, 4, nums2E, 2) // [0,0,1,2,2,8]

var nums1D = [-1,0,1,1,0,0,0,0,0]
var nums2D = [-1,0,2,2,3]
merge(&nums1D, 4, nums2D, 5) // [-1,-1,0,0,1,1,2,2,3]

var nums1C = [0,0,3,0,0,0,0,0,0]
var nums2C = [-1,1,1,1,2,3]
merge(&nums1C, 3, nums2C, 6)

var nums1B = [4,0,0,0,0,0]
var nums2B = [1,2,3,5,6]
merge(&nums1B, 1, nums2B, 5)


var nums1 = [1,2,3,0,0,0]
var nums2 = [2,5,6]
merge(&nums1, 3, nums2, 3)

var nums1A = [4,5,6,0,0,0]
var nums2A = [1,2,3]
merge(&nums1A, 3, nums2A, 3)





func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    nums1.removeSubrange(m..<nums1.count)
    nums1.append(contentsOf: nums2)
    nums1.sort()
}
var nums1V = [4,5,6,0,0,0]
var nums2V = [1,2,3]
merge2(&nums1V, 3, nums2V, 3)
