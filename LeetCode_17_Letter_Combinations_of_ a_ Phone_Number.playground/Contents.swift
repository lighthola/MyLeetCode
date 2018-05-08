/*
 LeetCode - Medium
 17. Letter Combinations of a Phone Number
 
 runtime: 12 ms, 98.26 % beats of swift submissions
 inspire:
 */

import Foundation

class Solution {
    
    let letterMap: [Character: [String]] = ["2": ["a", "b", "c"],
                                            "3": ["d", "e", "f"],
                                            "4": ["g", "h", "i"],
                                            "5": ["j", "k", "l"],
                                            "6": ["m", "n", "o"],
                                            "7": ["p", "q", "r", "s"],
                                            "8": ["t", "u", "v"],
                                            "9": ["w", "x", "y", "z"]]
    
    func letterCombinations(_ digits: String) -> [String] {
        let digits = Array(digits)
        var results: [String] = []
        for number in digits {
            if let letters = letterMap[number] {
                if results.isEmpty {
                    results.append(contentsOf: letters)
                } else {
                    let times = results.count
                    let tmp = results
                    for _ in 1..<letters.count {
                        results.append(contentsOf: tmp)
                    }
                    for j in 0..<times {
                        for (i, letter) in letters.enumerated() {
                            results[j+i*times].append(letter)
                        }
                    }
                }
            }
        }
        return results
    }
}

print(Solution().letterCombinations("23"))
