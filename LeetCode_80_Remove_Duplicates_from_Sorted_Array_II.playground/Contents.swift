/*
 LeetCode - Easy
 80. Remove Duplicates from Sorted Array II
 
 runtime: 12 ms, 100 % beats of swift submissions
 inspire:
 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count > 2 {
            var target = Int.min
            var times = 0
            var i = 0
            var count = nums.count
            while i < count {
                if nums[i] > target {
                    if times > 2 {
                        let rmIndex = (i - times + 2)
                        for _ in rmIndex..<i {
                            nums.remove(at: rmIndex)
                            count -= 1
                            i -= 1
                        }
                        target = nums[i - rmIndex]
                        times = 1
                    } else {
                        target = nums[i]
                        times = 1
                        i += 1
                    }
                } else {
                    times += 1
                    i += 1
                }
            }
            
            if times > 2 {
                let i = count - 1
                let rmIndex = (i - times + 2)
                for _ in rmIndex..<i {
                    nums.remove(at: rmIndex)
                    count -= 1
                }
            }
        }
        return nums.count
    }
}

var nums = [1,1,1,2,2,2,3,3]
Solution().removeDuplicates(&nums)
print(nums)
