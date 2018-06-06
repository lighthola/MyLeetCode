/*
 LeetCode - Medium
 48. Rotate Image
 
 runtime: 12 ms, 100 % beats of swift submissions
 better ans:
 */

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<(n+1)/2 {
            for j in 0..<n/2 {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[n-j-1][i]
                matrix[n-j-1][i] = matrix[n-i-1][n-j-1]
                matrix[n-i-1][n-j-1] = matrix[j][n-i-1]
                matrix[j][n-i-1] = tmp
            }
        }
    }
}

var m: [[Int]] = []
m = [[1,2,3],[4,5,6],[7,8,9]]
//m = [[5 ,1 ,9 ,11],
//     [2 ,4 ,8 ,10],
//     [13,3 ,6 ,7],
//     [15,14,12,16]]
Solution().rotate(&m)
[[15,13,2 ,5],
 [14,3 ,4 ,1],
 [12,6 ,8 ,9],
 [16,7 ,10,11]]

