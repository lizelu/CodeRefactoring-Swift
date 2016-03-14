//========Replace data Value with Object(以对象取代数据值)===============
//现象：数据项在使用是与其他数据项进行组合出现才有意义
//解决方案：抽象成数据模型类，使用该数据模型来代替数据项组合
class PersonModel {
    
    private var name: String
    private var birthday: String
    private var sender: String
    
    init(name: String, birthday: String, sender: String) {
        self.name = name
        self.birthday = birthday
        self.sender = sender
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getBirthday() -> String {
        return self.birthday
    }
    
    func getSender() -> String {
        return self.sender
    }
}
