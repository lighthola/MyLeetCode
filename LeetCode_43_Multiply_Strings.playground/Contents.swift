/*
 LeetCode - Medium
 43. Multiply Strings
 
 runtime: 76 ms, 94.59 % beats of swift submissions
 inspire:
 */

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        let num1 = num1.reversed().map{ Int(String($0))! }
        let num2 = num2.reversed().map{ Int(String($0))! }
        var rec = Array(repeating: 0, count: num1.count + num2.count)
        
        
        for i in 0..<num2.count {
            for j in 0..<num1.count {
                let index = i + j
                let ans = num1[j] * num2[i]
                if ans > 9 {
                    rec[index] += ans % 10
                    if rec[index] > 9 {
                        rec[index] -= 10
                        rec[index + 1] += 1
                    }
                    rec[index + 1] += ans / 10
                    if rec[index + 1] > 9 {
                        rec[index + 1] -= 10
                        rec[index + 2] += 1
                    }
                } else {
                    rec[index] += ans
                    if rec[index] > 9 {
                        rec[index] -= 10
                        rec[index + 1] += 1
                    }
                }
            }
        }
        
        let result = Array(rec.reversed()).reduce(into: "", { (string, num) in
            if string.isEmpty {
                if num != 0 {
                    string += String(num)
                }
            } else {
                string += String(num)
            }
        })
        
        return result.isEmpty ? "0" : result
    }
}

Solution().multiply("123", "456")
