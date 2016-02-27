//---1.表达式使用临时变量代替，Introduce Explaining Variable(引入解释性变量)------
class Product{
    var quantity: Double
    var itemPrice: Double
    
    init(quantity:Double, itemPrice:Double) {
        self.quantity = quantity
        self.itemPrice = itemPrice
    }
    
    func getPrice() -> Double {
        let basePrice:Double = quantity * itemPrice                                     //基础价格
        let quantityDiscount:Double = max(0, quantity - 500) * itemPrice * 0.05         //折扣
        let shipping:Double = min(basePrice * 0.1, 100)                                 //运费
        return basePrice - quantityDiscount + shipping
    }
}
