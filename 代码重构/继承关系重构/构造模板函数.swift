//=== Form Template Method (构造模板函数)=============
//现象：不同类中的方法中大体步骤相同，具体细节不同
//解决方案：将细节进行封装，将步骤提取到父类中

class SuperClass0 {

}

class Subclass01: SuperClass0 {
    func calculate() -> Double {
        let a: Double = 10 * 90 - 2
        let b: Double = 10 / 5 + 30
        return a + b
    }
}

class Subclass02: SuperClass0 {
    func calculate() -> Double {
        let a: Double = 4 * 5 - 6
        let b: Double = 1 / 5 + 2
        return a + b    //假设a+b为较为复杂的业务逻辑模板
    }
}


//=====================构造模板函数
class SuperClass {
    func calculate() -> Double {
       return getA() + getB()
    }

    func getA() -> Double {
        return 0
    }

    func getB() -> Double {
        return 0
    }
}

class Subclass1: SuperClass {

    override func getA() -> Double {
        return 10 * 90 - 2
    }

    override func getB() -> Double {
        return 10 / 5 + 30
    }
}

class Subclass2: SuperClass {

    override func getA() -> Double {
        return 4 * 5 - 6
    }

    override func getB() -> Double {
        return 1 / 5 + 2
    }
}

let sub1: Subclass1 = Subclass1()
sub1.calculate()
let sub2: Subclass2 = Subclass2()
sub2.calculate()

