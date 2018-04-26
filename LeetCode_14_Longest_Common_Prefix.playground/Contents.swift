/*
 LeetCode - Easy
 14. Longest Common Prefix
 
 runtime: 20 ms, 89.43 % beats of swift submissions
 inspire:
 */

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
//        if strs.count == 0 {
//            return ""
//        }
//
//        if strs.count == 1 {
//            return strs[0]
//        }
//
//        var result: [Character] = []
//        var index = 0
//        let target = Array(strs[0])
//        outer: while true {
//            if index < strs[0].count {
//                let targetC: Character = target[index]
//                for i in 1..<strs.count {
//                    if index < strs[i].count {
//                        let c = Array(strs[i])[index]
//                        if c != targetC {
//                            break outer
//                        }
//                    } else {
//                        break outer
//                    }
//                }
//                result.append(targetC)
//                index += 1
//            } else {
//                break
//            }
//        }
//
//        return String(result)
        
        
        if strs.count == 0 {
            return ""
        }
        
        let minStr = strs.reduce("") { (result, str) -> String in
            return result.isEmpty ? str : str.count > result.count ? str : result
        }
        
        var prefix = minStr
        var prefixArr = Array(prefix)
        for str in strs {
            while !str.hasPrefix(prefix) {
                prefixArr = Array(prefixArr[0..<prefixArr.count-1])
                prefix = String(prefixArr)
                if prefix.isEmpty {
                    return ""
                }
            }
        }
        
        return prefix
    }
}

let s = Solution()
s.longestCommonPrefix(["flower","fl","flight"])
s.longestCommonPrefix(["abc","abcc","abc","abca","abca"])
