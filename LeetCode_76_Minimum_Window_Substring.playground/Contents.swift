/*
 LeetCode - Hard
 76. Minimum Window Substring
 
 runtime: 52 ms, 100 % beats of swift submissions
 reference: https://leetcode.com/problems/minimum-window-substring/discuss/26808/Here-is-a-10-line-template-that-can-solve-most-'substring'-problems
 */


class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        
        let tUTF8 = Array(t.utf8).map{ Int($0) } // ascii
        let sUTF8 = Array(s.utf8).map{ Int($0) }
        
        var hash = Array(repeating: 0, count: 128)
        for c in tUTF8 {
            hash[c] += 1
        }
        
        var count = t.count, begin = 0, end = 0, d = Int.max, head = 0
        
        while end < sUTF8.count {
            if hash[sUTF8[end]] > 0 {
                count -= 1
            }
            hash[sUTF8[end]] -= 1
            end += 1
            
            while count == 0 {
                if end - begin < d { // valid
                    head = begin
                    d = end - head
                }
                
                if hash[sUTF8[begin]] == 0 {
                    count += 1
                }
                hash[sUTF8[begin]] += 1
                begin += 1
            }
        }
        
        if d == Int.max {
            return ""
        }
        
        let beginIndex = s.index(s.startIndex, offsetBy: head)
        let endIndex = s.index(s.startIndex, offsetBy: head + d)
        return String(s[beginIndex..<endIndex])
    }
}

Solution().minWindow("A", "AA")
// "BANC"

