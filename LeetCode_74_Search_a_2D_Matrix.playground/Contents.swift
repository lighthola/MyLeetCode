/*
 LeetCode - Medium
 74. Search a 2D Matrix
 
 runtime: 16 ms, 100 % beats of swift submissions
 reference:
 */

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty {
            return false
        }
        
        if matrix[0].isEmpty {
            return false
        }
        
        for i in 0 ..< matrix.count {
            if matrix[i][matrix[0].count - 1] >= target {
                for j in 0 ..< matrix[0].count {
                    if matrix[i][j] == target {
                        return true
                    }
                }
                return false
            }
        }
        
        return false
    }
}

let matrix = [
    [1,   3,  5,  7],
    [10, 11, 16, 20],
    [23, 30, 34, 50]
]


Solution().searchMatrix(matrix, 50)
