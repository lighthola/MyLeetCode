/*
 LeetCode - Easy
 69. Sqrt(x)
 
 runtime: 28 ms, 85.85 % beats of swift submissions
 reference:
 */


class Solution {
    func mySqrt(_ x: Int) -> Int {
        var l = 0
        var r = x
        var ans: Int = 0
        while l <= r {
            let mid = (l + r) / 2
            let p = mid * mid
            
            if p == x {
                return mid
            }
            
            if p > x {
                r = mid - 1
            } else {
                l = mid + 1
                ans = mid
            }
        }
        return ans
    }
}



Solution().mySqrt(2)
