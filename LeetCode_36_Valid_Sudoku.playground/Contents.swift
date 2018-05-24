/*
 LeetCode - Medium
 36. Valid Sudoku
 
 runtime: 92 ms, 32.73 % beats of swift submissions
 inspire:
 */

class Solution {
    
    func isSingleVaild(_ flatBoard: [String]) -> Bool {
        let rec: [String: Bool] = ["0": false, "1": false, "2": false, "3": false, "4": false, "5": false, "6": false, "7": false, "8": false, "9": false ]
        for i in 0..<9 {
            var recCp = rec
            for j in 0..<9 {
                let num = flatBoard[i * 9 + j]
                if num != "." {
                    if recCp[num]! {
                        return false
                    }
                    recCp[num] = true
                }
            }
        }
        return true
    }
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {

        let flatBoard = board.flatMap { $0.map{ String($0) } }

        let temp: [String] = Array(repeating: ".", count: 81)
        var flatBoard2 = temp
        var flatBoard3 = temp
        for i in 0..<81 {
            flatBoard2[i / 9 + i % 9 * 9] = flatBoard[i]
            let big = i % 27
            let mid = (big % 9)
            flatBoard3[(mid / 3) * 9 + mid % 3 + (big / 9) * 3 + (i / 27) * 27] = flatBoard[i]
        }

        return isSingleVaild(flatBoard) && isSingleVaild(flatBoard2) && isSingleVaild(flatBoard3)
        //return isSingleVaild(flatBoard, flatBoard2, flatBoard3)
    }
    
    func isSingleVaild(_ flatBoard: [String], _ flatBoard2: [String], _ flatBoard3: [String]) -> Bool {
        let rec: [String: Bool] = ["0": false, "1": false, "2": false, "3": false, "4": false, "5": false, "6": false, "7": false, "8": false, "9": false ]
        for i in 0..<9 {
            var recCp = rec, recCp2 = rec, recCp3 = rec
            for j in 0..<9 {
                let num = flatBoard[i * 9 + j]
                if num != "." {
                    if recCp[num]! {
                        return false
                    }
                    recCp[num] = true
                }
                
                let num2 = flatBoard2[i * 9 + j]
                if num2 != "." {
                    if recCp2[num2]! {
                        return false
                    }
                    recCp2[num2] = true
                }
                
                let num3 = flatBoard3[i * 9 + j]
                if num3 != "." {
                    if recCp3[num3]! {
                        return false
                    }
                    recCp3[num3] = true
                }
            }
        }
        return true
    }
}

let ss: [[Character]] = [["8","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
Solution().isValidSudoku(ss)
