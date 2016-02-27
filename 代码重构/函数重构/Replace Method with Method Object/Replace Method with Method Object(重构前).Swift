//===============Replace Method with Method Object(以函数对象取代函数)===================
//现象：对于大型函数，其中对局部变量的使用使你无法采用Extract Method
//解决方案：将该函数放入一个单独的对象中，将局部变量变成该单独对象的属性，然后就可以对该函数使用Extract Method了

//一个没有意义的测试案例
class Account {
    func discount(inputVal: Int, quantity: Int, yearToDate: Int) -> Int {
        
        let importantValue1 = inputVal * quantity + 10
        var importantValue2 = inputVal * yearToDate + 100
        
        if (yearToDate - importantValue1) > 100 {
            importantValue2 -= 2
        }
        
        let importantValue3 = importantValue2 * 8
        
        return importantValue3 - 2 * importantValue1
    }
}
