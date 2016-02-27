//Remove Assignments to Parameters
func discountOver(inputVal: Int, quantity: Int, yearToDate: Int) -> Int {
    var result = inputVal
    
    if inputVal > 50 {
        result -= 2
    }
    
    if quantity > 100 {
        result -= 1
    }
    
    if yearToDate > 5000 {
        result -= 3
    }
    return result
}
