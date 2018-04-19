/*
 LeetCode - Hard
 10. Regular Expression Matching
 
 runtime:  ms,  % beats of swift submissions
 better ans:
 */

import Foundation

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = Array(s), p = Array(p)
        
        let m: Int = s.count // 1
        let n: Int = p.count // 21
        var f: [[Bool]] = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: n + 1), count: m + 1)
        f[0][0] = true
        for i in 1 ... m {
            f[i][0] = false
        }
        for i in 1 ... n {
            f[0][i] = i > 1 && "*" == p[i-1] && f[0][i-2]
        }
        for i in 1 ... m {
            for j in 1 ... n {
                if p[j-1] != "*" {
                    f[i][j] = f[i - 1][j - 1] && (s[i - 1] == p[j - 1] || "." == p[j - 1])
                } else {
                    f[i][j] = f[i][j - 2] || (s[i - 1] == p[j - 2] || "." == p[j - 2]) && f[i - 1][j]
                }
            }
        }
        return f[m][n]
    }
}


let s = Solution()
s.isMatch("a", "aa")
s.isMatch("aa", "a*")
s.isMatch("ab", ".*c")
s.isMatch("aaaaaaaaaaaaab", "a*a*a*a*a*a*a*a*a*a*c")
s.isMatch("ac", "c*a*a*a*a*a*a*a*a*a*c")



