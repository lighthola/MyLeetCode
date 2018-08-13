/*
 LeetCode - Hard
 87. Scramble String
 
 runtime: 100 ms, 20 % beats of swift submissions
 Inspried: https://www.youtube.com/watch?v=Lq3Kr7-qXGI
 */


class Solution {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        
        if s1 == s2 {
            return true
        }
        
        if s1.count != s2.count {
            return false
        }

        let s1 = Array(s1)
        let s2 = Array(s2)
        
        if s1.sorted() != s2.sorted() {
            return false
        }
        
        for i in 1 ..< s1.count {
            let s1L = String(s1[0..<i])
            let s1R = String(s1[i...])
            
            var s2L = String(s2[0..<i])
            var s2R = String(s2[i...])
            if isScramble(s1L, s2L) && isScramble(s1R, s2R) {
                    return true
            }
            
            s2L = String(s2[0..<s2.count - i])
            s2R = String(s2[(s2.count - i)...])
            if isScramble(s1L, s2R) && isScramble(s1R, s2L) {
                return true
            }
        }

        return false
    }
}


Solution().isScramble("abb","bba")
