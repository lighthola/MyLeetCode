/*
 LeetCode - Medium
 18. 4Sum
 
 runtime: 84 ms, 92.31 % beats of swift submissions
 inspire:
 */

import Foundation

class Solution {
    class Solution {
        func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
            if nums.count < 4 {
                return []
            }
            let nums = nums.sorted()
            let count = nums.count
            var res = [[Int]]()
            for z in 0...count - 4 {
                if z > 0 && nums[z] == nums[z-1] {
                    continue
                }
                for i in z+1...count - 3 {
                    guard i - 1 == z || nums[i] != nums[i - 1] else {
                        continue
                    }
                    var left = i + 1
                    var right = count - 1
                    while left < right {
                        let sum = nums[left] + nums[right] + nums[z] + nums[i]
                        if  sum == target {
                            res.append([nums[z],nums[i],nums[left],nums[right]])
                            repeat {
                                left += 1
                            } while (left < right && nums[left] == nums[left - 1])
                            repeat {
                                right -= 1
                            } while (left < right && nums[right] == nums[right + 1])
                        } else if sum < target {
                            left += 1
                        } else {
                            right -= 1
                        }
                    }
                }
            }
            return res
        }
    }
}
