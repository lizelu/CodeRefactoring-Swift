//======Self Encapsulate Field (自封装字段)============
//现象：当直接访问字段时，增加了代码的耦合度
//解决方案：为字段提供setter/getter方法
//直接访问，间接访问
class IntRange {
    private var low: Int
    private var high: Int
    
    init(low: Int, high: Int) {
        self.low = low
        self.high = high
    }
    
    func grow(factor: Int) {
        self.high *= factor
    }
    
    func includes(arg: Int) -> Bool {
        return arg >= self.low && arg <= self.high
    }
}
