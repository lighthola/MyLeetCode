/*
 LeetCode - Medium
 19. Remove Nth Node From End of List
 
 runtime:  ms,  % beats of swift submissions
 inspire:
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if let head = head {
            var current = head
            var list: [ListNode] = [head]
            while let next = current.next {
                list.append(next)
                current = next
            }
            let total = list.count
            switch n {
            case total:
                return head.next
            default:
                list[total - n - 1].next = list[total - n].next
                return head
            }
        }
        return nil
    }
}

let head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(4)
head.next?.next?.next?.next = ListNode(5)

Solution().removeNthFromEnd(head, 2)

