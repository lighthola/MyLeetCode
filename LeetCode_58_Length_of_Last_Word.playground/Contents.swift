/*
 LeetCode - Easy
 58. Length of Last Word
 
 runtime: 16 ms, 87.50 % beats of swift submissions
 better ans:
 */

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let s = Array(s)
        var count = 0
        var searching = false
        for i in 0..<s.count {
            if s[i] == " " {
                searching = true
            } else {
                if searching {
                    searching = false
                    count = 1
                } else {
                    count += 1
                }
            }
        }
        return count
    }
}
