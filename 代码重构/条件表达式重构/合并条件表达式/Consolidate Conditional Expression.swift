//--------Consolidate Conditional Expression(合并条件表达式)------------
//现象：一些列的条件都会得到同样的结果
//解决方案：将这些条件进行合并

class TestDemo {
    var number1: Int
    var number2: Int
    var number3: Int
    
    init(number1: Int, number2: Int, number3: Int) {
        self.number1 = number1
        self.number2 = number2
        self.number3 = number3
    }
    
    func fetchResult() -> Int {
        //第一次需求迭代
        if number1 > 10 {
            return 30
        }
        
        //第二次需求迭代
        if number2 > 50 {
            return 30
        }
        
        //第三次需求迭代
        if number3 > 60 {
            return 30
        }
        
        return 0
    }
    //重构1
    func fetchResult1() -> Int {
        if number1 > 10 || number2 > 50 || number3 > 60 {
            return 30
        }
        
        return 0
    }
    
    
    //重构2
    func fetchResult2() -> Int {
        if isTrue() {
            return 30
        }
        
        return 0
    }
    func isTrue() -> Bool {
        return number1 > 10 || number2 > 50 || number3 > 60
    }

}
