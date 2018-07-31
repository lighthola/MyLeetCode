/*
 LeetCode - Medium
 82. Remove Duplicates from Sorted List II
 
 runtime: 32 ms, 90 % beats of swift submissions
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
        // for the Head Duplicates
        if var newHead = head {
            var isDuplicate = false
            while newHead.next != nil {
                if newHead.val != newHead.next!.val {
                    if !isDuplicate {
                        break
                    }
                    isDuplicate = false
                } else {
                    isDuplicate = true
                }
                newHead = newHead.next!
            }
            
            if isDuplicate {
                return nil
            }
            
            // for the center duplicates
            isDuplicate = false
            var tail = newHead
            if var current = newHead.next {
                var dupNumber = current.val
                while current.next != nil {
                    if dupNumber != current.next!.val {
                        if isDuplicate {
                            tail.next = current.next
                        } else {
                            tail = current
                        }
                        dupNumber = current.next!.val
                        isDuplicate = false
                    } else {
                       isDuplicate = true
                    }
                    current = current.next!
                }
            }
            
            if isDuplicate {
                tail.next = nil
            }
            
            return newHead
        }
        return nil
    }
}
