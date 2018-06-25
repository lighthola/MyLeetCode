/*
 LeetCode - Medium
 71. Simplify Path
 
 runtime: 32 ms, 88.89 % beats of swift submissions
 reference:
 */


import Foundation

class Solution {
    func simplifyPath(_ path: String) -> String {
        var rec: [String] = []
        
        for route in path.components(separatedBy: "/") {
            if route == ".." {
                rec.popLast()
            } else if route == "." || route == "" {
                continue
            } else {
                rec.append(route)
            }
        }
        
        return "/" + rec.joined(separator: "/")
    }
}

Solution().simplifyPath("/.../")
Solution().simplifyPath("/...")
Solution().simplifyPath("/.")
Solution().simplifyPath("/")
Solution().simplifyPath("/..")
Solution().simplifyPath("/home/")
Solution().simplifyPath("/a/./b/../../c/")
Solution().simplifyPath("/home//foo/")

