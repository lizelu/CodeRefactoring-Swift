//===Pull Up Constructor Body (将构造器上移)=============
//现象：两个子类拥有相同的字段函数
//解决方案：将函数移到超类中
//在Swift语言中必须这样做，必须调用父类构造器对

class MySuperClass {
    var a: Int = 0
    var b: Int = 0
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
}

class SubClass1: MySuperClass {
    var c: Int
    init(a: Int, b: Int, c: Int) {
        self.c = c
        super.init(a: a, b: b)
    }
}

class SubClass2: MySuperClass {
    var d: String
    init(a: Int, b: Int, d: String) {
        self.d = d
        super.init(a: a, b: b)
    }
}
