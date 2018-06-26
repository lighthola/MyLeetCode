/*
 LeetCode - Medium
 240. Search a 2D Matrix II
 
 runtime: 44 ms, 100 % beats of swift submissions
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
            }
        }
        
        return false
    }
}

let matrix = [
    [1,   4,  7, 11, 15],
    [2,   5,  8, 12, 19],
    [3,   6,  9, 16, 22],
    [10, 13, 14, 17, 24],
    [18, 21, 23, 26, 30]
]


Solution().searchMatrix(matrix, 20)
