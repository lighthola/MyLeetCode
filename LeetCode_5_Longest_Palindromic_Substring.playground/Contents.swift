//: Playground - noun: a place where people can play

/*
 LeetCode - Medium
    5. Longest Palindromic Substring
 
 rumtime: 28ms, 100% beats of swift submissions
 */


import UIKit

class Solution {
    
    func longestPalindrome(_ s: String) -> String {

        if s.count < 2 || s == String(s.reversed()) {
            return s
        }
        
        let s = Array(s) // don't use string subsript

        var skip = 0 // for "ffffffffff...ggg...."
        var minStart = 0, maxLen = 0
        for i in 0..<s.count {
            if skip > i {
                continue
            }
            
            if s.count - i <= maxLen / 2 {
                break
            }
            
            var j = i, k = i
            while k < s.count - 1 { // skip for same char
                if s[k+1] == s[k]  {
                    skip = k
                    k += 1
                } else {
                    break
                }
            }
            
            while k < s.count - 1 && j > 0 { // extend around center
                if s[k + 1] == s[j - 1] {
                    k += 1
                    j -= 1
                } else {
                    break
                }
            }

            let newLen = k - j
            if newLen > maxLen {
                minStart = j
                maxLen = newLen
            }
        }

        return String(s[minStart...minStart+maxLen])
    }
}


let s = Solution()
s.longestPalindrome("babad")
s.longestPalindrome("cbbd")
s.longestPalindrome("xabax")
s.longestPalindrome("acda")
s.longestPalindrome("ababababababababababa") == "ababababababababababa"
s.longestPalindrome("abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa")
s.longestPalindrome("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg")
s.longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth")
s.longestPalindrome("abbc")

