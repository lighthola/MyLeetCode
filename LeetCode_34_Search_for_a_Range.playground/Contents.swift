/*
 LeetCode - Medium
 34. Search for a Range
 
 runtime: 16 ms, 100 % beats of swift submissions
 inspire:
 */

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let i = search(nums, target)
        if i != -1 {
            var result = [i, i]
            var l = true, r = true
            while l || r {
                if l == true {
                    if result[0] != 0 && nums[result[0] - 1] == target {
                        result[0] -= 1
                    } else {
                        l = false
                    }
                }
                
                if r == true {
                    if result[1] != nums.count - 1 && nums[result[1] + 1] == target {
                        result[1] += 1
                    } else {
                        r = false
                    }
                }
            }
            return result
        }
        return [-1, -1]
    }
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1
        
        while l <= r {
            let m = l + (r - l) / 2
            if nums[m] == target {
                return m
            }
            
            if nums[m] < target {
                l = m + 1
            } else {
                r = m - 1
            }
        }
        return -1
    }
}

Solution().searchRange([0,0,0,1,2,3], 0)
