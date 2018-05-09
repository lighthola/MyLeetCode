/*
 LeetCode - Medium
 22. Generate Parentheses
 
 runtime: 24 ms, 49.02 % beats of swift submissions
 inspire: https://leetcode.com/problems/generate-parentheses/solution/#approach-3-closure-number-accepted
 */

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var ans: [String] = []
        if n == 0 {
            ans.append("")
        } else {
            for i in 0..<n {
                for var left in generateParenthesis(i) {
                    for var right in generateParenthesis(n-1-i) {
                        ans.append("(" + left + ")" + right)
                    }
                }
            }
        }
        
        return ans
    }
}
