/*
 LeetCode - Medium
 46. Permutations
 
 runtime: 24 ms, 57.95 % beats of swift submissions
 better ans:
 */

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
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
            var numsCopy = nums
            numsCopy.remove(at: i)
            candidates.append(nums[i])
            backtracking(&result, &candidates, numsCopy, length)
            candidates.removeLast()
        }
    }
}

Solution().permute([1,2,3])


