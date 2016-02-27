//-----2.Replace Temp with Query  &  Extract Method----------
class Product{
    var quantity: Double
    var itemPrice: Double
    
    init(quantity:Double, itemPrice:Double) {
        self.quantity = quantity
        self.itemPrice = itemPrice
    }
    
    func getPrice() -> Double {
        return basePrice() - quantityDiscount() + shipping()
    }
    
    func basePrice() -> Double {
        return quantity * itemPrice
    }
    
    func quantityDiscount() -> Double {
        return max(0, quantity - 500) * itemPrice * 0.05         //折扣
    }
    
    func shipping() -> Double {
        return  min(basePrice() * 0.1, 100)                      //运费
    }
}
