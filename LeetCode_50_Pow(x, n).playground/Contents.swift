/*
 LeetCode - Medium
 50. Pow(x, n)
 
 runtime: 16 ms, 94.94 % beats of swift submissions
 better ans:
 */


class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        return n >= 0 ? rePow(x, n) : 1 / rePow(x, n)
    }
    
    func rePow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        
        let half = rePow(x, n / 2)
        return n % 2 == 0 ? (half * half) : (half * half * x)
    }
}

Solution().myPow(2.0, -2)
