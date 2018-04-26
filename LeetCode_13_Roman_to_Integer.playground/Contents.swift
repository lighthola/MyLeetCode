/*
 LeetCode - Medium
 13. Roman to Integer
 
 runtime: 92 ms, 80.67 % beats of swift submissions
 inspire:
 */

import UIKit

class Solution {
    func romanToInt(_ s: String) -> Int {
//        let romanDict:[String: Int] = ["M":1000,
//                         "CM":900, "D":500, "CD":400, "C":100,
//                         "XC":90, "L":50, "XL":40, "X":10,
//                         "IX":9, "V":5, "IV":4, "I":1]
//        let s = Array(s)
//        var i = 0
//        var result = 0
//        while i < s.count {
//            if i < s.count - 1, let twoRomanN = romanDict[String(s[i]) + String(s[i+1])] {
//                result += twoRomanN
//                i += 2
//            } else {
//                result += romanDict[String(s[i])] ?? 0
//                i += 1
//            }
//
//        }
//        return result

        
//        let romanDict:[Character: Int] = ["M":1000, "D":500, "C":100, "L":50, "X":10, "V":5, "I":1]
//        let s = Array(s)
//        var pre: Int = 1000
//        var result = 0
//
//        for c in s {
//            if let roman = romanDict[c] {
//                if pre < roman {
//                    result += roman - (2 * pre)
//                } else {
//                    result += roman
//                }
//                pre = roman
//            }
//        }
//
//        return result
        
        
        
        let s = Array(s)
        var pre: Int = 1000
        var result = 0
        
        for c in s {
            let number: Int
            switch c {
            case "M":
                number = 1000
            case "D":
                number = 500
            case "C":
                number = 100
            case "L":
                number = 50
            case "X":
                number = 10
            case "V":
                number = 5
            case "I":
                number = 1
            default:
                number = 0
            }
            
            if pre < number {
                result += number - (2 * pre)
            } else {
                result += number
            }
            pre = number
        }
        
        return result
    }
}

let s = Solution()
s.romanToInt("MCMXCIV")


