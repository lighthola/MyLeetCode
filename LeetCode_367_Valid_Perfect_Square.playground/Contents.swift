/*
 LeetCode - Easy
 367. Valid Perfect Square
 
 runtime: 12 ms, 100 % beats of swift submissions
 reference:
 */

class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        for i in 0... {
            let p = i * i
            if p == num {
                return true
            } else if p > num {
                return false
            }
        }
        return true
    }
}
