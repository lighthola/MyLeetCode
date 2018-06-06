/*
 LeetCode - Medium
 47. Permutations II
 
 runtime: 36 ms, 73.53 % beats of swift submissions
 better ans:
 */

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result: [[Int]] = []
        var candidates: [Int] = []
        backtracking(&result, &candidates, nums, nums.count)
        return result
    }
    
    func backtracking(_ result: inout [[Int]], _ candidates: inout [Int], _ nums:[Int], _ length: Int) {
        if candidates.count == length {
            result.append(candidates)
            return
        }
        
        for i in 0..<nums.count {
            
            if i > 0 && nums[i - 1] == nums[i] {
                continue
            }
            
            var numsCopy = nums
            numsCopy.remove(at: i)
            candidates.append(nums[i])
            backtracking(&result, &candidates, numsCopy, length)
            candidates.removeLast()
        }
    }
}

Solution().permuteUnique([3,3,0,3])
