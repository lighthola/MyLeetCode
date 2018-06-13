/*
 LeetCode - Medium
 60. Permutation Sequence
 
 runtime: 12 ms, 100 % beats of swift submissions
 better ans:
 */

class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var nums: [Int] = []
        for i in 1...n {
            nums.append(i)
        }
        var result: String = ""
        backtracking(&nums, n, k, factorial(n - 1), &result)
        return result
    }
    
    func backtracking(_ nums: inout [Int], _ n: Int, _ k: Int, _ count: Int, _ result: inout String) {
        if nums.count == 1 {
            result += String(nums[0])
            return
        }
        
        var index = k / count
        var nextIndex = k % count
        
        if nextIndex == 0 {
            index -= 1
            nextIndex = count
        }
        
        result += String(nums.remove(at: index))
        backtracking(&nums, n - 1, nextIndex, count / (n - 1), &result)
    }
    
    func factorial(_ n: Int) -> Int {
        var n = n
        var result = 1
        while n > 1 {
            result *= n
            n -= 1
        }
        return result
    }
}

Solution().getPermutation(4, 8)
