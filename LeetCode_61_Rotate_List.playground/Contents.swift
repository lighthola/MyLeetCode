/*
 LeetCode - Medium
 61. Rotate List
 
 runtime: 88.89 ms, 24 % beats of swift submissions
 better ans:
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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        if head?.next == nil {
            return head
        }
        
        var count = 2
        var tail: ListNode? = head?.next
        while tail?.next != nil {
            tail = tail?.next
            count += 1
        }
        
        let targetIndex = k % count
        if targetIndex == 0 {
            return head
        }
        
        tail?.next = head
        
        var target: ListNode? = head
        let times = (count - targetIndex)
        for i in 1...times {
            if i == times - 1 {
                tail = target?.next
            } else if 0 == times - 1 {
                tail = head
            }
            target = target?.next
        }
        tail?.next = nil
        return target
    }
}
