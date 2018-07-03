/*
 LeetCode - Medium
 90. Subsets II
 
 runtime: 20 ms, 46.15 % beats of swift submissions
 reference:
 */


class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = [[]]
        var candidates: [Int] = []
        backtracking(&result, &candidates, nums.sorted(), 0)
        return result
    }
    
    func backtracking(_ result: inout [[Int]], _ candidates: inout [Int], _ nums: [Int], _ start: Int) {

        for i in start ..< nums.count {
            if i > start && nums[i] == nums[i - 1] {
                continue
            }
            
            candidates.append(nums[i])
            result.append(candidates)
            backtracking(&result, &candidates, nums, i + 1)
            candidates.popLast()
        }
    }
}

Solution().subsetsWithDup([1,1,2])
