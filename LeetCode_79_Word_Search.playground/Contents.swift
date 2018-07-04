/*
 LeetCode - Medium
 79. Word Search
 
 runtime: 112 ms, 100 % beats of swift submissions
 reference:
 */


/*
 board =
 [
 ['A','B','C','E'],
 ['S','F','C','S'],
 ['A','D','E','E']
 ]
 
 Given word = "ABCCED", return true.
 Given word = "SEE", return true.
 Given word = "ABCB", return false.
 */

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let word = Array(word)
        let row = board.count
        let col = board[0].count
        
        if row * col < word.count {
            return false
        }
        
        let map = board.map{ $0.map{ _ in false } } // route map

        for i in 0 ..< row {
            for j in 0 ..< col {
                if board[i][j] == word[0] {
                    if word.count == 1 {
                        return true
                    }
                    
                    var map = map
                    map[i][j] = true
                    
                    // Found the first character, then backtracking next.
                    if backtracking(board, i, j, word, 1, row, col, &map) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func backtracking(_ board: [[Character]], _ i: Int, _ j: Int, _ word: [Character], _ index: Int, _ row: Int, _ col: Int, _ map: inout [[Bool]]) -> Bool {
        
        let isLast = index == word.count - 1

        for side in 0...3 {
            switch side {
            case 0: // left
                if j == 0 {
                    continue // out of index
                }
                
                if map[i][j - 1] == true { // if this step has been arrived
                    continue
                }
                
                if board[i][j - 1] == word[index] {
                    map[i][j - 1] = true // mark it arrived
                    if isLast || backtracking(board, i, j - 1, word, index + 1, row, col, &map){
                        return true
                    }
                    map[i][j - 1] = false // if the route is bad way
                }
                
            case 1: // up
                if i == 0 {
                    continue
                }
                
                if map[i - 1][j] == true {
                    continue
                }
                
                if board[i - 1][j] == word[index] {
                    map[i - 1][j] = true
                    if isLast || backtracking(board, i - 1, j, word, index + 1, row, col, &map) {
                        return true
                    }
                    map[i - 1][j] = false
                }
                
            case 2: // right
                if j == col - 1 {
                    continue
                }
                
                if map[i][j + 1] == true {
                    continue
                }
                
                if board[i][j + 1] == word[index] {
                    map[i][j + 1] = true
                    if isLast || backtracking(board, i, j + 1, word, index + 1, row, col, &map) {
                        return true
                    }
                    map[i][j + 1] = false
                }
                
            case 3: // down
                if i == row - 1 {
                    continue
                }
                
                if map[i + 1][j] == true {
                    continue
                }
                
                if board[i + 1][j] == word[index] {
                    map[i + 1][j] = true
                    if isLast || backtracking(board, i + 1, j, word, index + 1, row, col, &map) {
                        return true
                    }
                    map[i + 1][j] = false
                }
                
            default:
                fatalError()
            }
        }
        return false
    }
}


Solution().exist([["A","B"]], "BA")

