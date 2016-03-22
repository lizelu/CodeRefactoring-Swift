//===Pull Up Method (将函数上移)=============
//现象：两个子类拥有相同的字段函数
//解决方案：将函数移到超类中

class MySuperClass0 {
    
}

class SubClass01: MySuperClass0 {
    func sameFunction() {
        
    }
}

class SubClass02: MySuperClass0 {
    func sameFunction() {
        
    }
}


//============函数上移=============
class MySuperClass {
    func sameFunction() {
        
    }
}

class SubClass1: MySuperClass {
    
}

class SubClass2: MySuperClass {
    
}



//===Pull Down Method (将函数下移)=============
//现象：父类中某个函数只有某一个子类使用
//解决方案：将函数移动到相应的子类中
