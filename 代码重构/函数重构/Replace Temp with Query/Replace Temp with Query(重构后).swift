class Product{
    var quantity: Int
    var itemPrice: Double
    init(quantity:Int, itemPrice:Double) {
        self.quantity = quantity
        self.itemPrice = itemPrice
    }
    
    func getPrice() -> Double {
        return getBasePrice() * getDiscountFactor()
    }
    
    func getBasePrice() -> Double {
        return Double(self.quantity) * self.itemPrice
    }
    
    func getDiscountFactor() -> Double {
        if getBasePrice() > 1000 {
            return 0.95
        } else {
            return 0.98
        }
    }
}
