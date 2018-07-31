/*
 LeetCode - Easy
 83. Remove Duplicates from Sorted List
 
 runtime: 28 ms, 100 % beats of swift submissions
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if var current = head {
            while current.next != nil {
                if current.val == current.next!.val {
                    current.next = current.next!.next
                } else {
                    current = current.next!
                }
            }
        }
        return head
    }
}
