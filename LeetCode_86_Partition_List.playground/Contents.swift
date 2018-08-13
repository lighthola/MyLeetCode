/*
 LeetCode - Medium
 86. Partition List
 
 runtime:  ms,  % beats of swift submissions
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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let left = ListNode(-1)
        var leftCurr = left
        let right = ListNode(-1)
        var rightCurr = right
        var curr = head
        while curr != nil {
            if curr!.val < x {
                leftCurr.next = curr
                leftCurr = curr!
            } else {
                rightCurr.next = curr
                rightCurr = curr!
            }
            curr = curr!.next
        }
        rightCurr.next = nil
        leftCurr.next = right.next
        return left.next
    }
}

let a = ListNode(1)
let b = ListNode(4)
let c = ListNode(3)
let d = ListNode(2)
let e = ListNode(5)
let f = ListNode(2)
a.next = b
b.next = c
c.next = d
d.next = e
e.next = f

let result = Solution().partition(a, 3)

func printLists(_ head: ListNode) {
    var memo = [head.val]
    var current = head.next
    while current != nil {
        memo.append(current!.val)
        current = current!.next
    }
    print(memo)
}

printLists(result!)
