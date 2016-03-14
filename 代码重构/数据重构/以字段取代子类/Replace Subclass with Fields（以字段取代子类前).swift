//==========Replace Subclass with Fields（以字段取代子类)============
//现象：各个子类中唯一的差别只在“返回常量数据”的函数上
//解决方案：修改这些函数，使他们返回超类中某个（新增）字段，然后销毁子类
//案例
enum SenderCode: String {
    case Male = "M"
    case Female = "F"
}

protocol PersonType {
    func isMale() -> Bool
    func getCode() -> String
}

class Male: PersonType {
    func isMale() -> Bool {
        return true
    }
    
    func getCode() -> String {
        return SenderCode.Male.rawValue
    }
}

class Female: PersonType {
    func isMale() -> Bool {
        return false
    }
    
    func getCode() -> String {
        return SenderCode.Female.rawValue
    }
}


let male: PersonType = Male()
male.isMale()
male.getCode()

let female: PersonType = Female()
female.isMale()
female.getCode()
