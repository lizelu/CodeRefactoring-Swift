//重构, 提取电话号码信息，使用Extract Class
class TelephoneNumber {
    var areaCode: String
    var number: String
    
    init(areaCode: String, number: String) {
        self.areaCode = areaCode
        self.number = number
    }
}

class Person {
    let name: String
    var officeTelephoneNumber: TelephoneNumber
   
    init(name:String, officeTelephoneNumber: TelephoneNumber) {
        self.name = name
        self.officeTelephoneNumber = officeTelephoneNumber
    }
    
    func getOfficeAreaCode() -> String{
        return officeTelephoneNumber.areaCode
    }
    
    func getOfficeNumber() -> String{
        return officeTelephoneNumber.number
    }
}

