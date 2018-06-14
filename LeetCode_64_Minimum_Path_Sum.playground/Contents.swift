/*
 LeetCode - Medium
 64. Minimum Path Sum
 
 runtime: 40 ms, 93.10  % beats of swift submissions
 better ans:
 */


/*
 Input:
 [
 [1,3,1],
 [1,5,1],
 [4,2,1]
 ]
 Output: 7
 */

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        
        var dp: [Int] = Array(repeatElement(1, count: n))
        dp[0] = grid[0][0]
        for i in 1 ..< n {
             dp[i] = dp[i - 1] + grid[i][0]
        }
        
        for i in 1..<m {
            for j in 0..<n {
                if j == 0 {
                    dp[0] = dp[0] + grid[0][i]
                } else {
                    dp[j] = min(dp[j - 1], dp[j]) + grid[j][i]
                }
            }
        }
        return dp[n - 1]
    }
}

Solution().minPathSum([[1,3,1],[1,5,1],[4,2,1]])
