//重构，在People中创建一个委托函数，以隐藏掉People对Department的委托关系

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
    private var department: Department      //该人所在部门, 私有化，进行隐藏，Private，当前文件可见
    
    init (name:String, department: Department) {
        self.name = name
        self.department = department
    }
    
    func getManager() -> People! {
        return self.department.manager
    }
}

let scotterManager = People(name: "Scott", department: Department(chargeCode: "Creditease", manager: nil))
let zeluLi:People = People(name: "ZeluLi", department: Department(chargeCode: "Creditease", manager: scotterManager))

//zeluLi.department.manager.name
zeluLi.getManager().name