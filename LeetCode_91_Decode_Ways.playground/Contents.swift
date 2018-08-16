/*
 LeetCode - Medium
 91. Decode Ways
 
 runtime: 12 ms, 100  % beats of swift submissions
 reference by: https://leetcode.com/problems/decode-ways/discuss/157678/Java-DP-solution-both-O(n)-and-O(1)-space
 */

class Solution {
    func numDecodings(_ s: String) -> Int {
        // s is non-empty
        if s.first! == "0" {
            return 0
        }
        
        if s.count == 1 {
            return 1
        }
        
        var dp = Array(repeating: 0, count: s.count + 1)
        dp[0] = 1
        dp[1] = 1
        let codes = Array(s)
        
        for i in 2 ... codes.count {
            let pre = codes[i - 2]
            let curr = codes[i - 1]
            if curr == "0" {
                if pre > "2" || pre == "0" {
                    return 0
                }
                dp[i] = dp[i - 2]
            } else {
                if pre == "0" || pre > "2" || (pre == "2" && curr > "6")  {
                    dp[i] = dp[i - 1]
                } else {
                    dp[i] = dp[i - 2] + dp[i - 1]
                }
            }
        }
        //print(dp)
        return dp.last!
    }
}

Solution().numDecodings("110")
Solution().numDecodings("2267")
Solution().numDecodings("1010")
Solution().numDecodings("1212")
Solution().numDecodings("100")

