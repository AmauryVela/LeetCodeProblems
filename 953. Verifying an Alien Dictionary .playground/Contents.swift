//: A UIKit based Playground for presenting user interface
func isAlienSorted(_ words: [String], _ order: String) -> Bool {
    guard words.count > 1 && !words.isEmpty else { return true }
    var orderMap = [Character: Int]()
    for (index, c ) in order.enumerated() {
        orderMap[c] = index
    }

    for (index, word) in words.enumerated() {
        guard index + 1 < words.count else { break }
        let word = word.map{$0}
        let secondWord = words[index+1].map{$0}
        for i in 0..<word.count {
            guard i < secondWord.count else { return false }
            if orderMap[word[i]]! < orderMap[secondWord[i]]! {
                break
            }
            if orderMap[word[i]]! > orderMap[secondWord[i]]! {
                return false
            }
        }

    }

    return true
}
isAlienSorted(["world","wow"], "worldabcefghijkmnpqstuvxyz")

isAlienSorted(["apple","app"], "abcdefghijklmnopqrstuvwxyz")


isAlienSorted(["world","world","row"], "worldabcefghijkmnpqstuvxyz")


isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz")


isAlienSorted(["hello","leetcode"], "hlabcdefgijkmnopqrstuvwxyz")

/**

 This result is

 with orderMap[c1] ?? 0


 Runtime: 56 ms, faster than 6.33% of Swift online submissions for Verifying an Alien Dictionary.
 Memory Usage: 20.8 MB, less than 50.00% of Swift online submissions for Verifying an Alien Dictionary.

 Without the ??

 Runtime: 20 ms, faster than 94.94% of Swift online submissions for Verifying an Alien Dictionary.
 Memory Usage: 21 MB, less than 50.00% of Swift online submissions for Verifying an Alien Dictionary.
 */
