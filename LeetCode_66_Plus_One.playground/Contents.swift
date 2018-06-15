/*
 LeetCode - Easy
 66. Plus One
 
 runtime: 12 ms, 100 % beats of swift submissions
 reference:
 */

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var index = digits.count - 1
        
        while index > -1 {
            if digits[index] + 1 > 9 {
                digits[index] = 0
                index -= 1
            } else {
                digits[index] += 1
                break
            }
        }
        
        if index == -1 {
            digits.insert(1, at: 0)
        }
        
        return digits
    }
}
