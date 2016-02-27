//===============Remove Assignments to Parameters(移除对参数的赋值)===================
//现象：代码对一个函数的参数进行了赋值
//解决方案：以一个临时变量取代该参数的位置
func discount(var inputVal: Int, quantity: Int, yearToDate: Int) -> Int {
    if inputVal > 50 {
        inputVal -= 2
    }
    
    if quantity > 100 {
        inputVal -= 1
    }
    
    if yearToDate > 5000 {
        inputVal -= 3
    }
    return inputVal
}

