/*
 LeetCode - Hard
 84. Largest Rectangle in Histogram
 
 runtime: 32 ms, 100  % beats of swift submissions
 reference: https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28902/5ms-O(n)-Java-solution-explained-(beats-96)
 */

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let length = heights.count
        if length == 0 {
            return 0
        }
        /*
         Assume the height[i] is the height of the rectangle for which you need to find the left and right boundary.
         
         maxArea = (r - l - 1) * height
         */
        var lessFromLeft = Array(repeating: 0, count: length)
        var lessFromRight = lessFromLeft
        lessFromLeft[0] = -1
        lessFromRight[length - 1] = length
        
        for i in 1 ..< length {
            var p = i - 1
            while p >= 0 && heights[p] >= heights[i] {
                p = lessFromLeft[p]
            }
            lessFromLeft[i] = p
        }
        
        for i in (0 ..< length - 1).reversed() {
            var p = i + 1
            while p < length && heights[p] >= heights[i] {
                p = lessFromRight[p]
            }
            lessFromRight[i] = p
        }

        var maxArea = 0
        
        for i in 0 ..< length {
            maxArea = max(maxArea, heights[i] * (lessFromRight[i] - lessFromLeft[i] - 1))
        }
        
        return maxArea
    }
}

Solution().largestRectangleArea([2,1,5,6,2,3])


