/*
 LeetCode - Easy
 53. Maximum Subarray
 
 runtime: 20 ms, 92.17 % beats of swift submissions
 better ans:
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var rec = 0
        var maxN = Int.min
        
        for i in 0 ..< nums.count {
            rec = nums[i] + (rec < 0 ? 0 : rec)
            maxN = max(maxN, rec)
        }
        return maxN
    }
}


Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
