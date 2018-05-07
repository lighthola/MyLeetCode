/*
 LeetCode - Medium
 16. 3Sum Closest
 
 runtime: 84 ms, 33.33 % beats of swift submissions
 inspire:
 */

import Foundation

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count <= 3 {
            return nums.reduce(into: 0, { (result, num) in
                result += num
            })
        }
        
        let nums = nums.sorted()
        var minSum = Int.max - 99999
        for i in 1..<nums.count-1 {
            var l = i - 1, r = i + 1
            while l >= 0 && r < nums.count {
                let sum = nums[l] + nums[i] + nums[r]
                if sum == target {
                    return target
                } else if sum > target {
                    l -= 1
                } else {
                    r += 1
                }
                
                if abs(sum - target) < abs(minSum - target) {
                    minSum = sum
                }
            }
        }
        
        return minSum
    }
}


Solution().threeSumClosest([-3,0,1,2],1)
