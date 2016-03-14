//===========Replace Array or Dictionary with Object(以对象取代数组或字典)=========
//现象：一个数组或者字典中元素代表不同的东西
//解决方案：使用对象来替换数组或者字典，以一个字段表示一个元素。

let studentXiaoming: Dictionary = ["name": "小明", "age": 18]
let studentArray: Array = ["小明", 18]

//将上述字典或者数组改成数据类
class Student {
    let name: String
    let age: UInt
    
    init(name: String, age: UInt) {
        self.name = name
        self.age = age
    }
}
