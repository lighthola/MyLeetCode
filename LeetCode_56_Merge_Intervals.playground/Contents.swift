/*
 LeetCode - Medium
 56. Merge Intervals
 
 runtime: 72 ms, 100 % beats of swift submissions
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
    func merge(_ intervals: [Interval]) -> [Interval] {
        
        if intervals.count < 2 {
            return intervals
        }
        
        let intervals = intervals.sorted { (first, second) -> Bool in
            if first.start == second.start {
                return first.end > second.end
            }
            return first.start < second.start
        }
        
        var result: [Interval] = []
        var minStart = intervals[0].start
        var maxEnd = intervals[0].end
        
        for i in 1 ..< intervals.count {
            if intervals[i].start <= maxEnd {
                maxEnd = max(intervals[i].end, maxEnd)
            } else {
                result.append(Interval(minStart, maxEnd))
                minStart = intervals[i].start
                maxEnd = intervals[i].end
            }
            
            if i == intervals.count - 1 {
                result.append(Interval(minStart, maxEnd))
            }
        }
        return result
    }
}
