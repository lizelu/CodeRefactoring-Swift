//-----------3.Replace Temp with Query-------------

class Account {
    func discount(inputVal: Int, quantity: Int, yearToDate: Int) -> Int {
        return Discount(account: self, inputVal: inputVal, quantity: quantity, yearToDate: yearToDate).compute()
    }
}


class Discount {
    private let account: Account
    
    private var inputVal: Int
    private var quantity: Int
    private var yearToDate: Int
    
    
    init(account:Account, inputVal: Int, quantity: Int, yearToDate: Int) {
        self.account = account
        self.inputVal = inputVal
        self.quantity = quantity
        self.yearToDate = yearToDate
    }
    
    func compute() -> Int {
        return getResult()
    }
    
    func countImportantValue1() -> Int {
        return inputVal * quantity + 10
    }
    
    func countImportantValue2() -> Int {
        var result = inputVal * yearToDate + 100
        if (yearToDate - countImportantValue1()) > 100 {
            result -= 2
        }
        return result
    }
    
    func countImportantValue3 () -> Int {
        return countImportantValue2() * 8
    }
    
    func getResult() -> Int {
        return countImportantValue3() - 2 * countImportantValue1()
    }
    
}
