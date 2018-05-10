/*
 LeetCode - Hard
 25. Reverse Nodes in k-Group
 
 runtime: 40 ms, 64.71 % beats of swift submissions
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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        guard k > 1 else {
            return head
        }
        
        var newHead = head
        for _ in 1..<k {
            if let tmp = newHead?.next{
                newHead = tmp
            } else {
                return head
            }
        }
        
        var tmpHead = head
        let first = head
        var second = head?.next
        
        for _ in 1..<k {
            first?.next = second?.next
            second?.next = tmpHead
            tmpHead = second
            second = first?.next
        }
        first?.next = reverseKGroup(second, k)
        
        return newHead
    }
}
