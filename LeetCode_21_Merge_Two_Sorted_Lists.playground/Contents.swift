/*
 LeetCode - Easy
 21. Merge Two Sorted Lists
 
 runtime: 28 ms, 49.43 % beats of swift submissions
 inspire:
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        guard var n1 = l1 else {
            return l2
        }
        
        guard var n2 = l2 else {
            return l1
        }
        
        var recorder: [ListNode] = []
        
        while true {
            if n1.val <= n2.val {
                recorder.append(n1)
                if n1.next != nil {
                    n1 = n1.next!
                } else {
                    recorder.append(n2)
                    break
                }
            } else {
                recorder.append(n2)
                if n2.next != nil {
                    n2 = n2.next!
                } else {
                    recorder.append(n1)
                    break
                }
            }
        }
        
        for i in 0..<recorder.count-1 {
            recorder[i].next = recorder[i+1]
        }

        return recorder.first
    }
}
