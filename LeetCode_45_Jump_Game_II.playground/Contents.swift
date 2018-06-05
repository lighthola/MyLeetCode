/*
 LeetCode - Hard
 45. Jump Game II
 
 runtime: 20 ms, 88.24 % beats of swift submissions
 better ans:
 */

class Solution {
    func jump(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return 0
        }
        
        var i = 0
        var step = 0
        while i < nums.count {
            let jump = nums[i]
            
            if i + jump >= nums.count - 1 {
                if i == nums.count - 1 {
                    return step
                } else {
                    return step + 1
                }
                
            }
            
            if jump == 0 {
                return step
            }
            
            var max = 0
            for j in i+1...i+jump {
                if nums[j] + j > max {
                    max = nums[j] + j
                    i = j
                }
            }
            step += 1
        }
        
        return step
    }
}


//Solution().jump([2,3,1,1,4])
//Solution().jump([2,1])
//Solution().jump([10,9,8,7,6,5,4,3,2,1,1,0])
Solution().jump([4,1,1,3,1,1,1])
