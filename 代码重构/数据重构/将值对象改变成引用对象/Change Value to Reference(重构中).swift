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
    
    init(customer: Customer) {
        self.customer = customer
    }
    
    func setCustomer(customer: Customer) {
        self.customer = customer
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

let zeluli = Customer(name: "lizelu", idCard: "123456")

let order1: Order = Order(customer: zeluli)
let order2: Order = Order(customer: zeluli)
let order3: Order = Order(customer: zeluli)

unsafeAddressOf(order1.getCustome())
unsafeAddressOf(order2.getCustome())
unsafeAddressOf(order3.getCustome())

order2.setCustomerName("ZeLuLi")

order1.getCustomerName()
order2.getCustomerName()
order3.getCustomerName()
