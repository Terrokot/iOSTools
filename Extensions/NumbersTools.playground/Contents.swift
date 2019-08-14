//If Number == 0 return false.
extension Int {
    var boolNumber: Bool {
      return self != 0
    }
}
// return amount of Symbols in Nubmer
extension Int {
    var amountOfSymbols: Int {
        var counter = 1
        var temp = self
        while (temp >= 10) {
            temp = temp / 10
            counter += 1
        }
        return counter
    }
}


