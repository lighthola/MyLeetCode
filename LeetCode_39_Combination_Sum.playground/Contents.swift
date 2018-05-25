/*
 LeetCode - Medium
 39. Combination Sum
 
 runtime: 32 ms, 93.51 % beats of swift submissions
 inspire:
 */

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var numbers: [Int] = []
        find(&result, &numbers, target, candidates.sorted(), 0)
        return result
    }
    
    func find(_ result: inout [[Int]], _ numbers: inout [Int], _ target: Int, _ candidates: [Int], _ start: Int) {
        if target == 0 {
            result.append(numbers)
            return
        }
        
        for i in start..<candidates.count {
            let next = target - candidates[i]
            if next >= 0 {
                numbers.append(candidates[i])
                find(&result, &numbers, next, candidates, i)
                numbers.removeLast()
            } else {
                return
            }
        }
    }
}

Solution().combinationSum([2,3,4], 8)
