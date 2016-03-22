//===Pull Up Field (字段上移)=============
//现象：两个子类拥有相同的字段
//解决方案：将字段移到超类中

class MySuperClass0 {
    
}

class SubClass1: MySuperClass0 {
    var a = 0
}

class SubClass2: MySuperClass0 {
    var a = 0
}

//===================上移===============
class MySuperClass {
    var a = 0
}

class SubClass01: MySuperClass {
    
}

class SubClass02: MySuperClass {
    
}

//===Pull Down Field (字段下移)=============
//现象：父类中的某一个字段只有一个某一个子类使用到
//解决方案：将该字段移到该子类中
