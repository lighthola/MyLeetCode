/*
 LeetCode - Medium
 63. Unique Paths II
 
 runtime: 20 ms, 60 % beats of swift submissions
 better ans:
 */

class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let n = obstacleGrid.count
        let m = obstacleGrid[0].count
        
        var absc = false
        
        var dp: [Int] = Array(repeatElement(1, count: n))
        for i in 0 ..< n {
            if absc {
                dp[i] = 0
                continue
            }
            
            if obstacleGrid[i][0] == 1 {
                absc = true
                dp[i] = 0
            }
        }

        absc = false
        
        for i in 1..<m {
            for j in 0..<n {
                if j == 0 {
                    if absc {
                        continue
                    }
                    
                    if obstacleGrid[0][i] == 1 {
                        absc = true
                        dp[0] = 0
                    }
                } else {
                    if obstacleGrid[j][i] == 1 {
                        dp[j] = 0
                    } else {
                        dp[j] = dp[j - 1] + dp[j]
                    }
                }
            }
        }
        return dp[n - 1]
    }
}

Solution().uniquePathsWithObstacles([[0,0,0],[0,1,0],[0,1,0]])
Solution().uniquePathsWithObstacles([[0,1]])
