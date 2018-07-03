/*
 LeetCode - Medium
 78. Subsets
 
 runtime: 16 ms, 67.68 % beats of swift submissions
 reference:
 */


class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var candidates: [Int] = []
        backtracking(&result, &candidates, nums, 0)
        return result
    }
    
    func backtracking(_ result: inout [[Int]], _ candidates: inout [Int], _ nums: [Int], _ start: Int) {
        
        result.append(candidates)
        
        for i in start ..< nums.count {
            candidates.append(nums[i])
            backtracking(&result, &candidates, nums, i + 1)
            candidates.popLast()
        }
    }
}

Solution().subsets([1,2,3])
