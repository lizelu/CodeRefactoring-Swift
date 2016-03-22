//========以委托取代继承（Replace Inheritance with Delegation）===========
//现象：子类只用到了父类的某些方法，而且没有继承父类的数据
//解决方案：将这种继承关系修改成委托代理关系

class SuperClass {
    var a: Int = 0
    var b: Int = 0

    func display(number: Int) {
        print(number)
    }
}

class SubClass: SuperClass {
    var c: Int = 100
}


//将继承关系修改成委托代理关系
class SuperClass01 {
    var a: Int = 0
    var b: Int = 0

    func display(number: Int) {
        print(number)
    }
}

class SubClass01 {
    var c: Int = 100

    let superObject = SuperClass01()    //代理对象

    func display(number: Int) {
        self.superObject.display(number)
    }
}


let subObject: SubClass01 = SubClass01()
subObject.display(subObject.c)



//========以继承取代委托（Replace Delegation with Inheritance）===========
//现象：两个类为委托关系，并经常为接口编写许多及其简单的委托函数
//解决方案：将委托类继承受托类，与上面正好相反
