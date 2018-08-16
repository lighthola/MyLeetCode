/*
 LeetCode - Hard
 639. Decode Ways II
 
 runtime: 296 ms, 100  % beats of swift submissions
 reference by:
 */

class Solution {
    func numDecodings(_ s: String) -> Int {
        // s is non-empty
        if s.first! == "0" {
            return 0
        }

        if s.count == 1 {
            if s == "*" {
                return 9
            } else {
                return 1
            }
        }
        
        var dp = Array(repeating: 0, count: s.count + 1)
        dp[0] = 1
        dp[1] = s.first! == "*" ? 9 : 1
        
        
        let codes = Array(s)
        
        for i in 2 ... codes.count {
            let pre = codes[i - 2]
            let curr = codes[i - 1]
            
            if curr == "0" {
                if pre > "2" || pre == "0" {
                    return 0
                }
                
                if pre == "*" {
                    dp[i] = dp[i - 2] * 2
                } else {
                    dp[i] = dp[i - 2]
                }
            } else if curr == "*" {
                if pre == "0" {
                    dp[i] = 9 * dp[i - 1]
                } else if pre == "1" {
                    dp[i] = 9 * (dp[i - 2] + dp[i - 1])
                } else if pre == "2" {
                    dp[i] = 9 * (dp[i - 2] + dp[i - 1]) - 3 * dp[i - 2] // expect 27~29
                } else if pre > "2" {
                    dp[i] = 9 * dp[i - 1]
                } else if pre == "*" {
                    dp[i] = 15 * dp[i - 2] + 9 * dp[i - 1] // condition "1" + "2"
                }
            } else {
                if pre == "0" || pre > "2" || (pre == "2" && curr > "6")  {
                    dp[i] = dp[i - 1]
                } else if pre == "*" {
                    if curr < "7" {
                        dp[i] = dp[i - 2] * 2 + dp[i - 1]
                    } else {
                        dp[i] = dp[i - 2] + dp[i - 1]
                    }
                } else {
                    dp[i] = dp[i - 2] + dp[i - 1]
                }
            }
            dp[i] = dp[i] % 1000000007
        }
        //print(dp)
        return dp.last!
    }
}
Solution().numDecodings("1*72*")//285
Solution().numDecodings("*0**0")//36
Solution().numDecodings("**1**")//18720
Solution().numDecodings("*11")
Solution().numDecodings("1***")
