/*
 LeetCode - Medium
 29. Divide Two Integers
 
 runtime: 28 ms, 100 % beats of swift submissions
 inspire:
 */

import Foundation

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        return dividend/divisor > 2147483647 ? 2147483647 : dividend/divisor
    }
}
