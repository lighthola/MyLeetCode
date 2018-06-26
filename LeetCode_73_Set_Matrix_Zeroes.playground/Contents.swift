/*
 LeetCode - Medium
 73. Set Matrix Zeroes
 
 runtime: 40 ms, 100 % beats of swift submissions
 reference:
 */


class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count
        let n = matrix[0].count
        
        
        var isFirstRowZero = false
        for i in 0 ..< m {
            if i == 0 {
                for j in 0 ..< n {
                    if matrix[i][j] == 0 {
                        isFirstRowZero = true
                        break
                    }
                }
            } else {
                var isRowZero = false
                for j in 0 ..< n {
                    if matrix[i][j] == 0 {
                        matrix[0][j] = 0
                        isRowZero = true
                    }
                }
                
                if isRowZero {
                    for j in 0 ..< n {
                        matrix[i][j] = 0
                    }
                }
            }
        }
        
        for j in 0 ..< n {
            for i in 1 ..< m {
                if matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
        }
        
        if isFirstRowZero {
            for j in 0 ..< n {
                matrix[0][j] = 0
            }
        }
    }
}


var martix = [
    [0,1,2,0],
    [3,4,5,2],
    [1,3,1,5]
]
Solution().setZeroes(&martix)
