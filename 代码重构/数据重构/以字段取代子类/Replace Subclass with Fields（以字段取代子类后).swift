//==========重构===================
enum SenderCode: String {
    case Male = "M"
    case Female = "F"
}

class PersonType {
    private let isMale: Bool
    private let code: String
    
    init(isMale: Bool, code: String) {
        self.isMale = isMale
        self.code = code
    }
    
    func getIsMale() -> Bool {
        return self.isMale
    }
    
    func getCode() -> String {
        return self.code
    }
    
    //创建工厂方法
    static func createMale() -> PersonType {
        return PersonType(isMale: true, code: SenderCode.Male.rawValue)
    }
    
    static func createFemale() -> PersonType {
        return PersonType(isMale: false, code: SenderCode.Female.rawValue)
    }
}

let male = PersonType.createMale()
male.getCode()
male.getIsMale()

let female = PersonType.createFemale()
female.getIsMale()
female.getCode()
