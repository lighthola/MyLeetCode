/*
 LeetCode - Hard
 41. First Missing Positive
 
 runtime: 16 ms, 96.30 % beats of swift submissions
 inspire:
 */


class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let nums = nums.sorted().filter{ $0 > 0 }
        var i = 0
        var k = 0
        while k != nums.count {
            if k < nums.count - 1 {
                if nums[k] == nums[k + 1] {
                    k += 1
                    continue
                }
            }

            if nums[k] != i + 1 {
                return i + 1
            }
            k += 1
            i += 1
        }
        return nums.count == 0 ? 1 : nums.last! + 1
    }
}

Solution().firstMissingPositive([0,2,2,1,1])
