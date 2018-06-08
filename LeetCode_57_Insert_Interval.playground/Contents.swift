/*
 LeetCode - Hard
 57. Insert Interval
 
 runtime: 40 ms, 100 % beats of swift submissions
 better ans:
 */

public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

class Solution {
    
    func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
        
        var result: [Interval] = []
        var minStart = newInterval.start
        var maxEnd = newInterval.end
        
        var isAppended = false
        
        for i in 0 ..< intervals.count {
            if intervals[i].end < newInterval.start {
                result.append(intervals[i])
            } else if intervals[i].start > newInterval.end {
                if !isAppended {
                    isAppended = true
                    result.append(Interval(minStart, maxEnd))
                }
                result.append(intervals[i])
            } else {
                minStart = min(intervals[i].start, minStart)
                maxEnd = max(intervals[i].end, maxEnd)
            }
        }
        
        if !isAppended {
            isAppended = true
            result.append(Interval(minStart, maxEnd))
        }
        
        return result
    }
}
