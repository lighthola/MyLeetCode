/*
 LeetCode - Hard
 37. Sudoku Solver
 
 runtime: 312 ms, 90 % beats of swift submissions
 inspire: https://leetcode.com/problems/sudoku-solver/discuss/15752/Straight-Forward-Java-Solution-Using-Backtracking
 */

class Solution {
    
    func solveSudoku(_ board: inout [[Character]]) {
        solver(&board)
    }

    func solver(_ board: inout [[Character]]) -> Bool {
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == "." {
                    for c in Array("123456789") {
                        if isVaild(board, i, j, c) {
                            board[i][j] = c
                            if solver(&board) {
                                return true
                            } else {
                                board[i][j] = "."
                            }
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    
    
    func isVaild(_ board: [[Character]], _ row: Int, _ col: Int, _ c: Character) -> Bool {
        let rOfst = (row / 3) * 3
        let cOfst = (col / 3) * 3
        for i in 0..<9 {
            if board[row][i] == c {
                return false
            }
            
            if board[i][col] == c {
                return false
            }
            
            if board[rOfst + i / 3][cOfst + i % 3] == c {
                return false
            }
        }
        return true
    }
}

var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]

Solution().solveSudoku(&board)
