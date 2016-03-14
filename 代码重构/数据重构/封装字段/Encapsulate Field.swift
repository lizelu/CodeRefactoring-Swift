//==========Encapsulate Field（封装字段)============
//现象：类中有字段为public类
//解决方案：将该字段转换成private，然后添加访问方法
//因为直接访问类的字段，会降低程序的模块化，不利于程序的扩充和功能的添加
class Person {
    var name: String = ""
    
    init(name: String) {
        self.name = name
    }
}

//添加对外访问的方法
class Person01 {
    private var name: String = ""
    
    init(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return name
    }
    
    func setName(name: String) {
        self.name = "China：" + name
    }
}
