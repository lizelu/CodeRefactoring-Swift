//===========Change Reference to Value(将引用对象改为值对象)=========
//现象：你有一个引用对象，该对象很小而且不可变，不易统一管理
//解决方案：将该引用对象改为值对象

class Currency {
    private let code: String
    
    init(code: String) {
        self.code = code
    }
    
    func getCode() -> String {
        return self.code
    }
}
//Equatable, 重载 ==
func ==(lhs: Currency, rhs: Currency) -> Bool {
    return lhs.getCode() == rhs.getCode()
}


let c1 = Currency(code: "001")
let c2 = Currency(code: "001")

c1 == c2
c1 === c2

unsafeAddressOf(c1)
unsafeAddressOf(c2)
