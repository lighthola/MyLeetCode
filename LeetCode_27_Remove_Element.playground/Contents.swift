/*
 LeetCode - Easy
 27. Remove Element
 
 runtime: 12 ms, 100 % beats of swift submissions
 inspire:
 */

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count > 0 {
            nums = nums.filter {
                $0 != val
            }
        }
        return nums.count
    }
}

