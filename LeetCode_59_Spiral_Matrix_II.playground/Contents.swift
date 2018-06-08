/*
 LeetCode - Medium
 59. Spiral Matrix II
 
 runtime: 12 ms, 100 % beats of swift submissions
 better ans:
 */


class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
        recover(&matrix, n)
        return matrix
    }
    
    func recover(_ matrix: inout [[Int]], _ n: Int, offset: Int = 0) {
        if n <= 0 {
            return
        }
        let pre = matrix.count * matrix.count - n * n
        let start = offset
        let end = n + offset
        
        for i in start ..< end {
            switch i {
            case start:
                for j in 0 ..< n {
                    matrix[i][j + offset] = j + 1 + pre
                }
            case end - 1:
                for j in 0 ..< n {
                    matrix[i][j + offset] = 3 * n - j - 2 + pre
                }
            default:
                matrix[i][end - 1] = n + i - start + pre
                matrix[i][start] = 4 * n - i - 3 + start + pre
            }
        }
        recover(&matrix, n - 2, offset: offset + 1)
    }
}

Solution().generateMatrix(6)
