/*
 LeetCode - Hard
 89. Gray Code
 
 runtime: 8 ms, 100  % beats of swift submissions
 reference by: https://leetcode.com/problems/gray-code/discuss/29891/Share-my-solution
 */

class Solution {
    func grayCode(_ n: Int) -> [Int] {
        var gCodes = [0]
        
        for i in 0..<n{
            for j in (0..<gCodes.count).reversed() {
                gCodes.append(gCodes[j] | 1 << i)
            }
        }

        return gCodes
    }
}

Solution().grayCode(3)


