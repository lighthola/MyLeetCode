/*
 LeetCode - Medium
 40. Combination Sum II
 
 runtime: 24 ms, 100 % beats of swift submissions
 inspire:
 */

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var numbers: [Int] = []
        find2(&result, &numbers, target, candidates.sorted(), 0)
        return result
    }
    
    func find2(_ result: inout [[Int]], _ numbers: inout [Int], _ target: Int, _ candidates: [Int], _ start: Int) {
        if target == 0 {
            result.append(numbers)
            return
        }
        
        for i in start..<candidates.count {
            let next = target - candidates[i]
            if next >= 0 {
                if i > start && candidates[i] == candidates[i - 1] {
                    continue
                }
                numbers.append(candidates[i])
                find2(&result, &numbers, next, candidates, i + 1)
                numbers.removeLast()
            } else {
                return
            }
        }
    }
}

Solution().combinationSum2([1,1,2,7,6,1,5], 8)

