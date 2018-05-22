/*
 LeetCode - Easy
 35. Search Insert Position
 
 runtime: 12 ms, 100 % beats of swift submissions
 inspire:
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1
        while l <= r {
            let m = l + (r - l) / 2
            if nums[m] == target {
                return m
            }
            
            if nums[m] < target {
                l = m + 1
            } else {
                r = m - 1
            }
        }
        return r
    }
}
