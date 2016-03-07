//===============Hide Delegate(隐藏“委托关系”)=============================================
//现象：客户通过一个委托类来调用另一个对象
//解决方案：在服务类上建立客户所需的所有函数，用以隐藏委托关系
//案例：
class Department {
    var chargeCode: String              //部门代码
    let manager: People!                 //经理
    
    init (chargeCode: String, manager: People!) {
        self.chargeCode = chargeCode
        self.manager = manager
    }
}

class People {
    var name:String
    var department: Department      //该人所在部门
    
    init (name:String, department: Department) {
        self.name = name
        self.department = department
    }
}

let scotterManager = People(name: "Scott", department: Department(chargeCode: "Creditease", manager: nil))
let zeluLi:People = People(name: "ZeluLi", department: Department(chargeCode: "Creditease", manager: scotterManager))

zeluLi.department.manager.name
