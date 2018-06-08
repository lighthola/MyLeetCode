/*
 LeetCode - Medium
 55. Jump Game
 
 runtime: 20 ms, 100 % beats of swift submissions
 better ans:
 */

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        return jump(nums) != -1
    }
    
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
                return -1
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

Solution().canJump([2,3,1,1,4])
Solution().canJump([3,2,1,0,4])


