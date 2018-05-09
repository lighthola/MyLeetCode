/*
 LeetCode - Hard
 24. Swap Nodes in Pairs
 
 runtime: 12 ms, 100 % beats of swift submissions
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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let newHead = head?.next else {
            return head
        }
        
        let tmp = head?.next?.next
        head?.next?.next = head
        head?.next = swapPairs(tmp)

        return newHead
    }
}
