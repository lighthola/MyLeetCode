/*
 LeetCode - Hard
 32. Longest Valid Parentheses
 
 runtime: 40 ms, 92.31 % beats of swift submissions
 inspire: https://leetcode.com/problems/longest-valid-parentheses/solution/#approach-3-using-stack-accepted
 */


class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        let s = Array(s)
        var maxAns = 0
        var stack: [Int] = [-1]
        for i in 0..<s.count {
            if s[i] == "(" {
                stack.append(i)
            } else {
                stack.removeLast()
                if stack.isEmpty {
                    stack.append(i)
                } else {
                    maxAns = max(maxAns, i - stack.last!)
                }
            }
        }

        return maxAns
    }
}

let cDict: [Character: Character] = [")": "(", "}": "{", "]": "["]

func isValid(_ s: String) -> Bool {
    let s = Array(s)
    var recorder: [Character] = []
    for c in s {
        switch c {
        case "(", "{", "[":
            recorder.append(c)
        case ")", "}", "]":
            if cDict[c] != nil {
                if cDict[c] == recorder.last {
                    recorder.removeLast()
                } else {
                    return false
                }
            }
        default:
            fatalError()
        }
    }
    
    return recorder.isEmpty
}
