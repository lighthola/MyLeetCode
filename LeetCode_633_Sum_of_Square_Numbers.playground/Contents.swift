/*
 LeetCode - Easy
 633. Sum of Square Numbers
 
 runtime: 20 ms, 94.74 % beats of swift submissions
 reference:
 */

import Foundation

class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        var i = 0
        while i * i <= c {
            if isPerfectSquare(c - i * i) {
                return true
            }
            i += 1
        }
        return false
    }
    
    func isPerfectSquare(_ num: Int) -> Bool {
        let result = sqrt(Double(num))
        return result == Double(Int(result))
    }
}

Solution().judgeSquareSum(5)



