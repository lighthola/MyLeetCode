/*
 LeetCode - Easy
 70. Climbing Stairs
 
 runtime: 8 ms, 100 % beats of swift submissions
 reference:
 */


class Solution {
    func climbStairs(_ n: Int) -> Int {
        var f0 = 0, f1 = 1
        var i = 0
        while i < n {
            let fn = f0 + f1
            f0 = f1
            f1 = fn
            i += 1
        }
        return f1
    }
}

Solution().climbStairs(6)
