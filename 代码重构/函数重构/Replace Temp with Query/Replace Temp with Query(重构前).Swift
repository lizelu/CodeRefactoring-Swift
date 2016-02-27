//===========================Replace Temp with Query（以查询取代临时变量）==========================================
//现象：在应用程序中，以一个临时变量保存某一个表达式的运算结果
//解决方案：将这个表达式提炼到一个独立的函数中。将这个临时变量的所有引用点替换为对新函数的调用，此后，新函数可以被其他函数使用

//------1--------
class Product{
    var quantity: Int
    var itemPrice: Double
    init(quantity:Int, itemPrice:Double) {
        self.quantity = quantity
        self.itemPrice = itemPrice
    }
    
    func getPrice() -> Double {
        let basePrice:Double = Double(self.quantity) * self.itemPrice
        
        var discountFactor:Double = 1
        if basePrice > 1000 {
            discountFactor = 0.95
        } else {
            discountFactor = 0.98
        }
        
        return basePrice * discountFactor
    }
}
