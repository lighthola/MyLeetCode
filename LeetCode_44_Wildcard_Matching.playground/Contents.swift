/*
 LeetCode - Hard
 44. Wildcard Matching
 
 runtime: 392 ms, 52.63 % beats of swift submissions
 inspire:
 */


class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        
        let s = Array(s)
        let p = Array(p)
        var rec: [[Bool]] = Array(repeating: Array(repeating: false, count: p.count + 1), count: s.count + 1)
        print(rec.count)
        rec[0][0] = true
        
        for i in 0..<p.count {
            if p[i] != "*" {
                break
            }
            rec[0][i + 1] = rec[0][i]
        }
        
        for i in 0..<s.count {
            for j in 0..<p.count {
                if p[j] != "*" {
                    if rec[i][j] {
                        if p[j] == "?" || s[i] == p[j] {
                            rec[i + 1][j + 1] = true
                        }
                    }
                } else {
                    if rec[i][j + 1] || rec[i + 1][j] {
                        rec[i + 1][j + 1] = true
                    }
                }
            }
        }
        
        return rec[s.count][p.count]
    }
}

Solution().isMatch("adceb", "*a*b")
Solution().isMatch("acdcb", "a*c?b")
Solution().isMatch("escdfimde", "*de")
Solution().isMatch("ac", "*ab")
Solution().isMatch("mississippi", "m??*ss*?i*pi")
Solution().isMatch("aaaa","***a")
Solution().isMatch("","")



