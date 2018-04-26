/*
 LeetCode - Medium
 12. Integer to Roman
 
 runtime: 100 ms, 37.78 % beats of swift submissions
 inspire:
 */

/*
 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 
 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 */

import Foundation

class Solution {
    
    func toNumArray(_ num: Int) -> [Int] {
        var recorder: [Int] = []
        var currentNum = num
        while currentNum > 0 {
            recorder.append(currentNum % 10)
            currentNum /= 10
        }
        return recorder.reversed()
    }
    
    func intToRoman(_ num: Int) -> String {
//        let nums = toNumArray(num)
//        var digit = nums.count
//        var result = ""
//
//        let romanMap: [[Int: String]] = [[1: "M", 2: "MM", 3: "MMM"],
//                                      [1: "C", 2: "CC", 3: "CCC", 4: "CD", 5: "D", 6: "DC", 7: "DCC", 8: "DCCC", 9: "CM"],
//                                      [1: "X", 2: "XX", 3: "XXX", 4: "XL", 5: "L", 6: "LX", 7: "LXX", 8: "LXXX", 9: "XC"],
//                                      [1: "I", 2: "II", 3: "III", 4: "IV", 5: "V", 6: "VI", 7: "VII", 8: "VIII", 9: "IX"]]
//
//        while digit > 0 {
//            let ref = romanMap[romanMap.count - digit]
//            if let roman = ref[nums[nums.count - digit]] {
//                result += roman
//            }
//            digit -= 1
//        }
//
//        return result
        
        let romanMap: [[Int: String]] = [[0:"", 1: "M", 2: "MM", 3: "MMM"],
                                         [0:"", 1: "C", 2: "CC", 3: "CCC", 4: "CD", 5: "D", 6: "DC", 7: "DCC", 8: "DCCC", 9: "CM"],
                                         [0:"", 1: "X", 2: "XX", 3: "XXX", 4: "XL", 5: "L", 6: "LX", 7: "LXX", 8: "LXXX", 9: "XC"],
                                         [0:"", 1: "I", 2: "II", 3: "III", 4: "IV", 5: "V", 6: "VI", 7: "VII", 8: "VIII", 9: "IX"]]

        return romanMap[0][num/1000]! + romanMap[1][num%1000/100]! + romanMap[2][(num%100)/10]! + romanMap[3][num%10]!
    }
}


let s = Solution()
s.intToRoman(2003)
print(s.intToRoman(2003))
print(123)





