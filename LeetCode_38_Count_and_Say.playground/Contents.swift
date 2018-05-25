/*
 LeetCode - Easy
 38. Count and Say
 
 runtime: 24 ms, 68.25 % beats of swift submissions
 inspire:
 */

class Solution {
    func countAndSay(_ n: Int) -> String {
        var say: [Character] = []
        
        for _ in 1...n {
            var next: [Character] = []
            if say.isEmpty {
                say += "1"
            } else {
                var j = 0
                var c: Character = say[0]
                var count = 0
                while j < say.count {
                    if say[j] == c {
                        count += 1
                    } else {
                        next += Array("\(count)\(c)")
                        c = say[j]
                        count = 1
                    }
                    j += 1
                }
                next += Array("\(count)\(c)")
                say = next
            }
        }
        
        return String(say)
    }
}
