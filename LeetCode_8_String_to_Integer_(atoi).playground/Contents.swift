/*
 LeetCode - Medium
 8. String to Integer (atoi)
 
 runtime: 36 ms, 92.86 % beats of swift submissions
 */

import Foundation

class Solution {
    func myAtoi(_ str: String) -> Int {
        
        if str.count == 0 {
            return 0
        }
        
        var s = ""
        var minus = false
        var opCount = 0
        
        for c in str {
            if c == " " {
                if s.count > 0 || opCount > 0 {
                    break
                }
                
                continue
            }
            
            if c == "-" {
                if opCount > 0 {
                    break
                }
                minus = true
                opCount += 1
                continue
            }
            
            if c == "+" {
                if opCount > 0 {
                    break
                }
                opCount += 1
                continue
            }
            
            if c >= "0" && c <= "9" {
                s += String(c)
            } else {
                break
            }
        }
        
        if minus {
            s = "-" + s
        }
        
        if let double = Double(s) {
            if double < Double(Int32.min) {
                return Int(Int32.min)
            }

            if double > Double(Int32.max) {
                return Int(Int32.max)
            }

            return Int(double)
        }

        return 0
    }
}


let s = Solution()
s.myAtoi("42") // 42
s.myAtoi("   -42")  // -42
s.myAtoi("4193 with words")  // 4193
s.myAtoi("words and 987")  // 0
s.myAtoi("-91283472332")  // Int32.min
s.myAtoi("3.14159") // 3
s.myAtoi("   -115579378e25") // Int32.min
s.myAtoi("+1")  // 1
s.myAtoi("+-1") // 0
s.myAtoi("   +0 123") // 0
s.myAtoi("   - 321") // 0

