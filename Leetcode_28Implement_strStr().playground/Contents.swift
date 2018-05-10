/*
 LeetCode - Easy
 28. Implement strStr()
 
 runtime: 20 ms, 95.83 % beats of swift submissions
 inspire:
 */

import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if haystack.count < needle.count {
            return -1
        }
        let h = Array(haystack)
        let n = Array(needle)
        let count = needle.count
        for i in 0...haystack.count - count {
            if Array(h[i..<i+count]) == n {
                return i
            }
        }
        return needle.isEmpty ? 0 : -1
    }
}
