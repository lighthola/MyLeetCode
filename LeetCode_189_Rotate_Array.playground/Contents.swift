/*
 LeetCode - Easy
 189. Rotate Array
 
 runtime: 20 ms, 90.43 % beats of swift submissions
 better ans:
 */


class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.count < 2 {
            return
        }
        
        let targetIndex = k % nums.count
        if targetIndex == 0 {
            return
        }
        
        let splitIndex = nums.count - targetIndex
        nums = Array(nums[splitIndex...] + nums[0..<splitIndex])
    }
}
