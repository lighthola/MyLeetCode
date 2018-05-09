/*
 LeetCode - Easy
 20. Valid Parentheses
 
 runtime: 20 ms, 64.29 % beats of swift submissions
 inspire:
 */

class Solution {
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
}
