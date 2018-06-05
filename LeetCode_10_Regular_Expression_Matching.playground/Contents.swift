/*
 LeetCode - Hard
 10. Regular Expression Matching
 
 runtime: 24 ms, 100 % beats of swift submissions
 better ans:
 */

import Foundation

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = Array(s), p = Array(p)
        var rec: [[Bool]] = Array(repeating: Array(repeating: false, count: p.count + 1), count: s.count + 1)
        
        rec[0][0] = true
        for i in 0..<p.count {
            if p[i] == "*" {
                rec[0][i + 1] = rec[0][i - 1]
            }
        }
        
        for i in 0..<s.count {
            for j in 0..<p.count {
                if p[j] != "*" {
                    if rec[i][j] {
                        if p[j] == "." || p[j] == s[i] {
                            rec[i + 1][j + 1] = true
                        }
                    }
                } else {
                    if rec[i + 1][j - 1] {
                        rec[i + 1][j + 1] = true
                    } else if rec[i][j - 1] || rec[i][j + 1] {
                        if p[j - 1] == s[i] || p[j - 1] == "."   {
                            rec[i + 1][j + 1] = true
                        }
                    }
                }
            }
        }

        return rec[s.count][p.count]
    }
}


let s = Solution()
//s.isMatch("ssi", "s*")
//s.isMatch("aa", "a*")
//s.isMatch("iss", "is*")
//s.isMatch("ssipp","s*p*")
s.isMatch("aaa", "ab*a*c*a")



