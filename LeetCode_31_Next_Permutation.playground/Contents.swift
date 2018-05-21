/*
 LeetCode - Medium
 31. Next Permutation
 
 runtime: 20 ms, 65.38 % beats of swift submissions
 inspire:
 */

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count - 1
        var target = -1
        
        while i > 0 {
            if nums[i] <= nums[i - 1] {
                i -= 1
            } else {
                target = i - 1
                break
            }
        }
        
        if target != -1 {
            i = nums.count - 1
            while i > 0 {
                if nums[i] <= nums[target] {
                    i -= 1
                } else {
                    nums.swapAt(i, target)
                    nums[(target+1)...].sort()
                    break
                }
            }
        } else {
            nums.sort()
        }
    }
}
