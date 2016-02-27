//===============Introduce Explaining Variable(引入解释性变量)===================
//现象：函数中含有一个复杂的表达式
//解决方案：将复杂表达式（或其中一部分）的结果放进一个临时变量，以此变量名称来解释表达式用途
class Product{
    var quantity: Double
    var itemPrice: Double
    
    init(quantity:Double, itemPrice:Double) {
        self.quantity = quantity
        self.itemPrice = itemPrice
    }
    
    func getPrice() -> Double {
        return quantity * itemPrice - max(0, quantity - 500) * itemPrice * 0.05 + min(quantity * itemPrice * 0.1, 100)
    }
}
