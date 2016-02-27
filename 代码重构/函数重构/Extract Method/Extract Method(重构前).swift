//======================Extract Method(提炼函数)=============================
//现象：一段代码可以被组织在一起并独立出来
//解决方案：将这段代码放进一个独立的函数中，并让函数名称解释该函数的用途
//使用Extract Method：把一段代码从原先函数中提取出来，放进一个单独函数中。这与Inline Method相反：将一个函数调用动作替换为该函数本体。

//1
class MyCustomer {
    
    let name: String
    let orders:Array<Int>
    
    init(name:String, orders:Array<Int>) {
        self.name = name
        self.orders = orders
    }
    
    func printOwing() {
        
        //print banner
        print("***********************************************")
        print("*********       Custome Owes       ************")
        print("***********************************************")
        
        var outstanding:Int = 0
        for order in orders {
            outstanding += order
        }
        
        //print detail
        print("name:\(self.name)")
        print("amount:\(outstanding)")
    }
}
