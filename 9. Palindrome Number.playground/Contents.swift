//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

/*:
 # 9. Palindrome Number
 Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.


 **Example 1:**

 ```
 Input: 121
 Output: true
 ```

 **Example 2:**

 ```
 Input: -121
 Output: false

 **Explanation:** From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 ```

 **Example 3:**

 ```
 Input: 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 ```

 **Follow up:**

 Coud you solve it without converting the integer to a string?
*/

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x >= 0 && x <= 9 {
            return true
        }
        guard x > 0, !x.isMultiple(of: 10) else {
                return false
        }

        var num = x
        var arrayInt = [Int]()
        arrayInt.append(num%10)
        while num >= 10 {
            num = num/10
            arrayInt.insert(num%10, at: 0)
        }
        return arrayInt == arrayInt.reversed()
    }
}

let input = -121

Solution().isPalindrome(input)
Solution().isPalindrome(0)
Solution().isPalindrome(10)
Solution().isPalindrome(60)
Solution().isPalindrome(90)
Solution().isPalindrome(122)
Solution().isPalindrome(121)

func isPalindrome(_ x: Int) -> Bool {
    if x<0 {return false}
    var temp = x
    var result = 0
    while temp > 0 {
        result = result * 10 + temp % 10
        print(result)
        temp = (temp - temp % 10) / 10
        print(temp)
        print("....")
    }
    if result == x {
        return true

    }else {
        return false
    }
}
isPalindrome(122)


122 % 10
// Result 2
(122 - 2)/10
// Temp 12


12%10
20 + 2
// Result 22
(22 - 2)/10
// Temp 1


