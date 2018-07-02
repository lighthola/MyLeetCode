/*
 LeetCode - Medium
 75. Sort Colors
 
 runtime: 16 ms, 52.00 % beats of swift submissions
 reference:
 */


class Solution {
    func sortColors(_ nums: inout [Int]) {
        
        var index = 0
        
        for i in index ..< nums.count {
            if nums[i] == 0 {
                nums.swapAt(index, i)
                index += 1
            }
        }
        
        for i in index ..< nums.count {
            if nums[i] == 1 {
                nums.swapAt(index, i)
                index += 1
            }
        }
    }
}


