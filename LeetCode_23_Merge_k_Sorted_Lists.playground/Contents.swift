/*
 LeetCode - Hard
 23. Merge k Sorted Lists
 
 runtime: 72 ms, 98.63 % beats of swift submissions
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
        if let l1 = l1, let l2 = l2 {
            if l1.val <= l2.val {
                l1.next = mergeTwoLists(l1.next, l2)
                return l1
            } else {
                l2.next = mergeTwoLists(l1, l2.next)
                return l2
            }
        }
        return l1 == nil ? l2 : l1
    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists = lists, interval = 1, count = lists.count
        while interval < count {
            var i = 0
            while i + interval < count {
                lists[i] = mergeTwoLists(lists[i], lists[i+interval])
                i += interval * 2
            }
            interval *= 2
        }
        return lists.isEmpty ? nil : lists[0]
    }
}

