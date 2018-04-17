//: Playground - noun: a place where people can play

/*
 LeetCode - Medium
    6. ZigZag Conversion
 
 runtime: 72 ms, 89.39% beats of swift submissions
 */

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        
        if numRows < 2 {
            return s
        }
        
        let s = Array(s)
        var subSI = 0 // index of current appended String
        var subS: [String] = Array(repeating: "", count: numRows) // sub string array
        var op = false // true + false -
        
        for i in 0..<s.count {
            subS[subSI] += String(s[i])
            
            if subSI == 0 || subSI == numRows - 1 {
                op = !op
            }
            
            if op {
                subSI += 1
            } else {
                subSI -= 1
            }
        }
        
        let result = subS.reduce("") { (result, sub) -> String in
            return result + sub
        }
        
        return result
    }
}

let s = Solution()
s.convert("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR"
s.convert("AB", 1)
s.convert("ABC", 2)
s.convert("PAYPALISHIR", 4)

/* 3
 0   4   8   12
 P   A   H   N
 A P L S I I G  1 3 5 7 9 11 13
 Y   I   R
 2   6   10
 */
