/*
 LeetCode - Medium
 9. Palindrome Number
 
 runtime:  ms,  % beats of swift submissions
 better ans: https://leetcode.com/problems/palindrome-number/discuss/5329/swift-beats-100
 */

import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        
        let s = Array(String(x))
        
        return s == s.reversed()
    }
}


let s = Solution()

s.isPalindrome(1212)



