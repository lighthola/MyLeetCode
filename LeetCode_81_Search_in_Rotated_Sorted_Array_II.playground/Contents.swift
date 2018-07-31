/*
 LeetCode - Medium
 81. Search in Rotated Sorted Array II
 
 runtime: 12 ms, 100 % beats of swift submissions
 inspire:
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var l = 0
        var r = nums.count - 1
        
        while l <= r {
            let m = l + (r - l) / 2
            if nums[m] == target {
                return true
            }
            
            if nums[l] == nums[r] {
                l += 1
                continue
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
        return false
    }
}


Solution().search([1,3,1,1,1], 3)
