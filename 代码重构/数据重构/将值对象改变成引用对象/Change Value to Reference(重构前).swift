//===========Change Value to Reference (将值对象改变成引用对象)=========
//现象：从一个类中衍生出许多彼此相等的实例，希望将它们替换为同一个对象
//解决方案：将这个值对象改变成引用对象。
class Customer {
    private var name: String
    private var idCard: String
    
    init(name: String, idCard: String) {
        self.name = name
        self.idCard = idCard
    }
    
    func getName() -> String {
        return name
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func getIdCard() -> String {
        return idCard
    }
}

class Order {
    private var customer: Customer
    
    init(customerName: String, idCard: String) {
        self.customer = Customer(name: customerName, idCard: idCard)
    }
    
    func setCustomer(customerName: String, idCard: String) {
        self.customer = Customer(name: customerName, idCard: idCard)
    }
    
    func getCustome() -> Customer {
        return self.customer
    }
    
    func getCustomerName() -> String {
        return self.customer.getName()
    }
    
    func setCustomerName(name: String) {
        self.customer.setName(name)
    }
    func getCustomerIdCar() -> String {
        return self.customer.getIdCard()
    }
}

let order1: Order = Order(customerName: "zeluli", idCard: "1234567")
let order2: Order = Order(customerName: "zeluli", idCard: "1234567")
let order3: Order = Order(customerName: "zeluli", idCard: "1234567")

unsafeAddressOf(order1.getCustome())
unsafeAddressOf(order2.getCustome())
unsafeAddressOf(order3.getCustome())

order2.setCustomerName("ZeLuLi")

order1.getCustomerName()
order2.getCustomerName()
order3.getCustomerName()
