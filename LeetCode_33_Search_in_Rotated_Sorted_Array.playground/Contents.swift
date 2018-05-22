/*
 LeetCode - Medium
 33. Search in Rotated Sorted Array
 
 runtime: 16 ms, 96 % beats of swift submissions
 inspire:
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1
        
        while l <= r {
            let m = l + (r - l) / 2
            if nums[m] == target {
                return m
            }
            if nums[l] <= nums[m] {
                if nums[l] <= target && target < nums[m] {
                    r = m - 1
                } else {
                    l = m + 1
                }
            } else {
                if nums[r] >= target && target > nums[m] {
                    l = m + 1
                } else {
                    r = m - 1
                }
            }
        }
        return -1
    }
}
