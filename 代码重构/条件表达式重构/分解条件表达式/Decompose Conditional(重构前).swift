//--------Decompose Conditional(分解条件表达式)------------
//现象：某个条件语句非常的复杂
//解决方案：从if, else等条件自己种提取独立函数

class Commission {
    func fetchCommission(money: Double, day: Int) -> Double {
        if money > 10_000  && day > 30  {
            return money * Double(day) / 365 * 0.2          //假设为一些复杂的处理
        } else {
            return money * 30.0  / 365 * 0.1                //假设为一些复杂的处理
        }
    }
}
