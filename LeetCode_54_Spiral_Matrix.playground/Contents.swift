/*
 LeetCode - Easy
 54. Spiral Matrix
 
 runtime: 12 ms, 94.12 % beats of swift submissions
 better ans:
 */

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var peeling: [Int] = []
        var matrix = matrix
        peel(&matrix, &peeling)
        return peeling
    }
    
    func peel(_ matrix: inout [[Int]], _ peeling: inout [Int]) {
        if matrix.count == 0 {
            return
        }
        
        var top: [Int] = []
        var left: [Int] = []
        var right: [Int] = []
        var bottom: [Int] = []
        
        for i in 0..<matrix.count {
            switch i {
            case 0:
                top.append(contentsOf: matrix[0])
                matrix[0] = []
            case matrix.count - 1:
                bottom.append(contentsOf: matrix[i])
                matrix[i] = []
            default:
                right.append(matrix[i].last!)
                matrix[i].removeLast()
                if matrix[i].count > 0 {
                    left.append(matrix[i][0])
                    matrix[i].removeFirst()
                }
            }
        }
        
        peeling = peeling + top + right + bottom.reversed() + left.reversed()
        matrix = matrix.filter { !$0.isEmpty }
        peel(&matrix, &peeling)
    }
}

Solution().spiralOrder([[1,2,3,4],
                        [5,6,7,8],
                        [9,10,11,12],
                        [13,14,15,16]])
