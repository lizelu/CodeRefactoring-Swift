//===============Extract Class(提炼类)=============================================
//现象：某个类做了应该由，两个类做的事情
//解决方案：创建一个新类，将相关的字段和函数从旧类搬移到新类中。


class Employee {
    let name: String
    var officeAreaCode: String
    var officeNumber: String
    
    init(name:String, officeAreaCode: String, officeNumber: String) {
        self.name = name
        self.officeAreaCode = officeAreaCode
        self.officeNumber = officeNumber
    }
}
