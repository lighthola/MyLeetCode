/*
 LeetCode - Medium
 62. Unique Paths
 
 runtime:  ms,  % beats of swift submissions
 better ans: https://leetcode.com/problems/unique-paths/discuss/22954/0ms-5-lines-DP-Solution-in-C++-with-Explanations
 */


class Solution {
    func uniquePaths2(_ m: Int, _ n: Int) -> Int {
        var dp: [Int] = Array(repeatElement(1, count: n))
        
        for _ in 1..<m {
            print(dp[0])
            for j in 1..<n {
                dp[j] = dp[j - 1] + dp[j]
                print(dp[j])
            }
            print("----")
        }
        
        return dp[n - 1]
    }
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        let small = min(n, m)
        
        if small == 1 {
            return 1
        }
        
        let large = max(m, n)
        let steps = m + n - 2
        
        var ans = 1
        for i in large...steps {
            ans *= i
        }
        ans /= factorial(small - 1)
        
        return ans
    }
    
    func factorial(_ n: Int) -> Int {
        var n = n
        var result = 1
        while n > 1 {
            result *= n
            n -= 1
        }
        return result
    }
}

Solution().uniquePaths2(7, 3)
