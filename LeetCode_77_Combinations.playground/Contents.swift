/*
 LeetCode - Medium
 77. Combinations
 
 runtime: 436 ms, 62.50 % beats of swift submissions
 reference:
 */


class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result: [[Int]] = []
        var candidates: [Int] = []
        backtracking(&result, &candidates, 0, n + 1, k)
        return result
    }
    
    func backtracking(_ result: inout [[Int]], _ candidates: inout [Int] , _ start: Int, _ n: Int, _ k: Int) {
        
        if candidates.count == k {
            result.append(candidates)
            return
        }
        
        for i in (start + 1) ..< n {
            candidates.append(i)
            backtracking(&result, &candidates, i, n, k)
            candidates.popLast()
        }
    }
}

Solution().combine(4, 2)
