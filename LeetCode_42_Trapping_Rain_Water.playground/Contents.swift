/*
 LeetCode - Hard
 42. Trapping Rain Water
 
 runtime: 20 ms, 89.83 % beats of swift submissions
 inspire:
 */


class Solution {
    func trap(_ height: [Int]) -> Int {
        
        if height.count < 3 {
            return 0
        }
        
        var height = height
        
        var amount = 0
        var left = 0
        var leftIndex = -1
        var count = 0
        var start = 1
        var secondIndex = -1
        
        while leftIndex != 0 {
            for i in start..<height.count {
                if left == 0 {
                    if height[i - 1] > height[i] {
                        leftIndex = i - 1
                        left = height[i - 1]
                        count = height[i - 1] - height[i]
                        continue
                    }
                }
                
                if height[i] >= left {
                    amount += count
                    left = 0
                    count = 0
                    secondIndex = -1
                } else {
                    count += left - height[i]
                    if secondIndex == -1 {
                        secondIndex = i
                    } else {
                        if height[i] > height[secondIndex] {
                            secondIndex = i
                        }
                    }
                }
            }
            
            if leftIndex == -1 {
                return amount
            }
            
            if count != 0 {
                if secondIndex == -1 {
                    return amount
                }
                if leftIndex + 1 < height.count {
                    height[leftIndex] = height[secondIndex]
                    start = leftIndex + 1
                    left = 0
                    leftIndex = -1
                    count = 0
                } else {
                    return amount
                }
            } else {
                leftIndex = 0
            }
        }
        
        return amount
    }
}

Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1])

class Solution2 {
    
    func trap(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count-1
        
        var result = 0
        
        var maxLeft = 0
        var maxRight = 0
        
        while left < right {
            if height[left] < height[right] {
                maxLeft = max(maxLeft, height[left])
                result += maxLeft - height[left]
                left += 1
            } else {
                maxRight = max(maxRight, height[right])
                result += maxRight - height[right]
                right -= 1
            }
        }
        
        return result
    }
    
}
