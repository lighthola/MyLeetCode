/*
 LeetCode - Easy
 7. Reverse Integer
 
 runtime: 36 ms, 36.68 % beats of swift submissions
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        if let result = Int32(String(String(abs(x)).reversed())) {
            return x < 0 ? Int(-result) : Int(result)
        }
        return 0
    }
}


let s = Solution()
s.reverse(123)
