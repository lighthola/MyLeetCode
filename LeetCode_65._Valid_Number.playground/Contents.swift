/*
 LeetCode - Hard
 65. Valid Number
 
 runtime: 132 ms, 0 % beats of swift submissions
 reference: https://atedev.wordpress.com/2007/11/23/%E6%AD%A3%E8%A6%8F%E8%A1%A8%E7%A4%BA%E5%BC%8F-regular-expression/
 */

import Foundation

class Solution {
    func matches( _ text: String, pattern: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        return regex.firstMatch(in: text, options:[],
                                        range: NSMakeRange(0, text.count)) != nil
    }
    
    func isNumber(_ s: String) -> Bool {
        let pattern = "^(\\s*)[+-]?(\\.\\d+|\\d+\\.?\\d*)(e[+-]?\\d+)?(\\s*)$"
        return matches(s, pattern: pattern)
    }
}

Solution().isNumber(".1")
Solution().isNumber(" ")
Solution().isNumber("3.")
Solution().isNumber("e9")


