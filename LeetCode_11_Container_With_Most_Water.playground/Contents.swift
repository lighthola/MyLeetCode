/*
 LeetCode - Medium
 11. Container With Most Water
 
 runtime: 20 ms, 100 % beats of swift submissions
 inspire: https://leetcode.com/problems/container-with-most-water/solution/
 */

import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var max = 0
        
        while left != right {
            let len = right - left
            let size: Int
            
            if height[right] < height[left] {
                size = height[right] * len
                right -= 1
            } else {
                size = height[left] * len
                left += 1
            }
           
            if size > max {
                max = size
            }
        }
        
        return max
    }
}


let s = Solution()
s.maxArea([1,1])




