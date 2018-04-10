import Foundation

public extension Int {
    var isOdd: Bool {
        return self % 2 != 0
    }
}

public extension String {
    var isPalindrome: Bool {
        return self == String(reversed())
    }
}

extension String {
    subscript(_ i: Int) -> String {
        let index = self.index(startIndex, offsetBy: i)
        return String(self[index])
    }
    
    subscript(_ r: CountableClosedRange<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
        return String(self[startIndex...endIndex])
    }
    
    subscript(_ r: CountableRange<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
        return String(self[startIndex...endIndex])
    }
}
