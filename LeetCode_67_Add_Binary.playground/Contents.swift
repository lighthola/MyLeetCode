/*
 LeetCode - Easy
 67. Add Binary
 
 runtime: 40 ms, 51.61 % beats of swift submissions
 reference:
 */

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        
        var bigNums: [Int]
        var nums: [Int]
        let large: Int
        let small: Int
        
        if a.count >= b.count {
            large = a.count
            small = b.count
            bigNums = Array(a).map { Int(String($0))! }
            nums = Array(b).map { Int(String($0))! }
        } else {
            large = b.count
            small = a.count
            bigNums = Array(b).map { Int(String($0))! }
            nums = Array(a).map { Int(String($0))! }
        }
        
        for _ in 0..<large - small {
            nums = [0] + nums
        }
        
        var index = large - 1
        
        var carrying = false
        while index > -1 {
            if bigNums[index] + nums[index] > 1 {
                bigNums[index] = carrying ? 1 : 0
                carrying = true
            } else {
                bigNums[index] += nums[index]
                if carrying {
                    if bigNums[index] + 1 > 1 {
                        bigNums[index] = 0
                    } else {
                        bigNums[index] = 1
                        carrying = false
                    }
                }
            }
            index -= 1
        }
        
        if carrying {
            bigNums.insert(1, at: 0)
        }
        
        return bigNums.reduce(into: "") { $0 += String($1) }
    }
}

Solution().addBinary("1010","1011")
