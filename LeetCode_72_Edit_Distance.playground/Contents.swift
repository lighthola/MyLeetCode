/*
 LeetCode - Hard
 72. Edit Distance

 runtime: 132  ms, 0 % beats of swift submissions
 reference:
 */


class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let word1 = Array(word1)
        let word2 = Array(word2)
        let m = word1.count
        let n = word2.count
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        
        for i in 0...m {
            dp[0][i] = i
        }

        for i in 0...n {
            dp[i][0] = i
        }
        
        for i in 0...n {
            if i == 0 {
                continue
            }
            
            for j in 0...m {
                if j == 0 {
                    continue
                }
                
                if word1[j - 1] == word2[i - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] =  min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
                }
            }
        }

        return dp[n][m]
    }
}

Solution().minDistance("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdef","bcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefg")
Solution().minDistance("kitten","sitting")
Solution().minDistance("zoolog","zoog")
Solution().minDistance("intention", "execution")
Solution().minDistance("horse", "ros")
