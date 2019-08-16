
extension String {
    subscript(range: Range<Int>) -> (String) {
        get {
            if range.endIndex <= self.count {
                let start = self.index(self.startIndex, offsetBy: range.startIndex)
                let end = self.index(self.startIndex, offsetBy: range.endIndex)
                return String(self[start..<end])
            } else {
                print("Index out of range")
            }
            return ""
        }
        set {
            if range.endIndex <= self.count {
                let start = self.index(self.startIndex, offsetBy: range.startIndex)
                let end = self.index(self.startIndex, offsetBy: range.endIndex)
                self.removeSubrange(start..<end)
                self.insert(contentsOf: newValue, at: start)
            }
        }
    }
    mutating func truncate (from index: Int) -> () {
        if index <= self.count {
            let start = self.index(self.startIndex, offsetBy: index)
            self.removeSubrange(start..<self.endIndex)
            self.insert(contentsOf: "...", at: start)
        } else {
            print("Index out of range")
        }
    }
}

var text = "Hello World!"
print(text[6..<12])
text[6..<12] = "Egor!"
print(text)
text.truncate(from: 5)
print(text)




