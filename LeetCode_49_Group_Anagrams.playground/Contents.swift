/*
 LeetCode - Medium
 49. Group Anagrams
 
 runtime: 176 ms, 93.94 % beats of swift submissions
 better ans:
 */

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [String: [String]] = [:]
        for str in strs {
            let key = String(str.sorted())
            if dict[key] == nil {
                dict[key] = [str]
            } else {
                dict[key]!.append(str)
            }
        }
        return Array(dict.values)
    }
}

Solution().groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
