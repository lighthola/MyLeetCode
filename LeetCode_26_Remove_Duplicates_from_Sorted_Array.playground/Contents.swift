/*
 LeetCode - Easy
 26. Remove Duplicates from Sorted Array
 
 runtime: 36 ms, 66.07 % beats of swift submissions
 inspire:
 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count > 0 {
            nums = nums.reduce(into: [nums.first!]) { result, element in
                if result.last! != element {
                    result.append(element)
                }
            }
        }
        return nums.count
    }
}
