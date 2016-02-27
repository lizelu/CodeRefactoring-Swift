class MyCustomer {
    
    let name: String
    let orders:Array<Int>
    
    init(name:String, orders:Array<Int>) {
        self.name = name
        self.orders = orders
    }
    
    func printOwing() {
        printBanner()
        printDetail(getOutstanding())
    }
    
    func printBanner() {
        //print banner
        print("***********************************************")
        print("*********       Custome Owes       ************")
        print("***********************************************")
    }
    
    func printDetail(outstanding: Int) {
        //print detail
        print("name:\(self.name)")
        print("amount:\(outstanding)")
    }
    
    func getOutstanding() -> Int {
        var result:Int = 0
        for order in orders {
            result += order
        }
        return result
    }
}
