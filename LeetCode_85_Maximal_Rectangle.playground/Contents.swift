/*
 LeetCode - Hard
 85. Maximal Rectangle
 
 runtime: 92 ms, 53.33  % beats of swift submissions
 reference: https://www.youtube.com/watch?v=g8bSdXCG-lA
 */

class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 {
            return 0
        }
        
        let rows = matrix.count
        let cols = matrix[0].count
        
        var dp: [Int] = Array(repeating: 0, count: cols)
        var maxArea = 0
        
        for row in 0 ..< rows {
            for col in 0 ..< cols {
                if matrix[row][col] == "0" {
                    dp[col] = 0
                } else {
                    dp[col] += 1
                }
            }
            maxArea = max(maxArea, largestRectangleArea(dp))
        }
        
        return maxArea
    }
    
    // copy from the question 84
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

Solution().maximalRectangle([["1","0"],["1","0"]])
Solution().maximalRectangle([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]])
