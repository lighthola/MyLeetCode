/*
 LeetCode - Hard
 68. Text Justification
 
 runtime: 12 ms, 93.10 % beats of swift submissions
 reference:
 */


class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var result: [String] = []
        var start = 0
        var end = 0
        var length = 0
        for word in words {
            if length == 0 {
                length = word.count
                end += 1
                if end == words.count || word.count == maxWidth {
                    let space = String(Array(repeating: Character(" "), count: maxWidth - word.count))
                    result.append(word + space)
                    start = end
                    length = 0
                }
            } else {
                if word.count + length + 1 <= maxWidth {
                    length += word.count + 1
                    end += 1
                    if end == words.count {
                        var remainder =  0
                        let space = " "
                        var sentence = ""
                        for target in words[start..<end] {
                            if sentence.isEmpty {
                                sentence = target
                            } else {
                                if remainder > 0 {
                                    sentence += space + " " + target
                                    remainder -= 1
                                } else {
                                    sentence += space + target
                                }
                            }
                        }
                        sentence += String(Array(repeating: Character(" "), count: maxWidth - length))
                        result.append(sentence)
                    }
                } else {
                    if end - start > 1 {
                        let count = end - start
                        let spaces = maxWidth - length + (count - 1)
                        var remainder = spaces % (count - 1)
                        let space = String(Array(repeating: Character(" "), count: spaces / (count - 1)))
                        var sentence = ""
                        for target in words[start..<end] {
                            if sentence.isEmpty {
                                sentence = target
                            } else {
                                if remainder > 0 {
                                    sentence += space + " " + target
                                    remainder -= 1
                                } else {
                                    sentence += space + target
                                }
                            }
                        }
                        result.append(sentence)
                    } else {
                        let space = String(Array(repeating: Character(" "), count: maxWidth - words[start].count))
                        result.append(words[start] + space)
                    }
                    
                    if end == words.count - 1 {
                        let space = String(Array(repeating: Character(" "), count: maxWidth - word.count))
                        result.append(word + space)
                    }
                    
                    start = end
                    end += 1
                    length = word.count
                }
            }
        }
        return result
    }
}
Solution().fullJustify(["What","must","be","shall","be."],5)
Solution().fullJustify(["This", "is", "an", "example", "of", "text", "justification."],16)
Solution().fullJustify(["s"],1)
Solution().fullJustify(["a","b","c","d","e"],1)
Solution().fullJustify(["What","must","be","acknowledgment","shall","be"],16)
Solution().fullJustify(["Listen","to","many,","speak","to","a","few."],6)

