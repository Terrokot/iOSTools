//If Number == 0 return false. is
extension Int {
    var isPositive: Bool {
        return self >= 0
    }
    var isNegative: Bool {
        return !isPositive
    }
    var bool: Bool {
        return self != 0
    }
}
// return amount of Symbols in Nubmer
extension Int {
    var count: Int {
        return String(self).count
    }
}
extension Int {
    subscript(index: Int) -> (Int?) {
        get {
            if index < self.count {
                let temp    = String(self)
                let end     = temp.index(temp.startIndex, offsetBy: index + 1)
                let start   = temp.index(temp.startIndex, offsetBy: index)
                let range   = String(temp[start..<end])
                return Int(range)!
            } else {
                print("Index oun of range")
                return nil
            }
        }
        set {
            if (index <= self.count - 1) && (newValue != nil){
                let newChar = String(newValue!).first
                var temp    = String(self)
                let start   = temp.index(temp.startIndex, offsetBy: index)
                let end     = temp.index(temp.startIndex, offsetBy: index + 1)
                temp.removeSubrange(start..<end)
                temp.insert(newChar!, at: start)
                self = Int(temp)!
            } else {print("Index oun of range")}
        }
    }
}
/*
var a = 99
a.count
a.isNegative
a.isPositive
a.bool
a[100]
a[0] = 1
print(a)
*/
extension UInt8 {
    //extension Int8 {
    
    func binary() -> String {
        var result = ""
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

//let a: UInt8 = 10
//let a: Int8 = 10
//a.binary()
 
