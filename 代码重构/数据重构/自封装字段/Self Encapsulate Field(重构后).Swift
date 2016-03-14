//为上述字段添加setter和getter方法

class IntRange {
    private var low: Int
    private var high: Int
    
    init(low: Int, high: Int) {
        self.low = low
        self.high = high
    }
    
    func grow(factor: Int) {
        setHigh(getHigh() * factor)
    }
    
    func includes(arg: Int) -> Bool {
        return arg >= getLow() && arg <= getHigh()
    }
    
    func setLow(low: Int) {
        self.low = low
    }
    
    func getLow() -> Int {
        return self.low
    }
    
    func setHigh(high: Int) {
        self.high = high
    }
    
    func getHigh() -> Int {
        return self.high
    }
}

//为InRange添加子类时，间接赋值的好处才会体现出来
class CappedRange: IntRange {
    private var cap: Int
    
    init(low: Int, high: Int, cap: Int) {
        self.cap = cap
        super.init(low: low, high: high)
    }
    
    func getCap() -> Int {
        return self.cap
    }
    
    override func getHigh() -> Int {
        return min(super.getHigh(), getCap())
    }
}

var  capRange:CappedRange = CappedRange(low: 10, high: 100, cap: 50)
capRange.getHigh()
capRange.includes(51)
capRange.includes(50)
