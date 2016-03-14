//==创建Customer工厂，使Order中的customer对象变成引用类型
class Customer {
    private var name: String
    private var idCard: String
    static private var customers: Dictionary<String, Customer> = Dictionary()
    
    private init(name: String, idCard: String) {
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
    
    //工厂方法
    static func createCustomer(name: String, idCard: String) -> Customer {
        guard let instance: Customer = Customer.customers[idCard] else {
            Customer.addCustomer(name, idCard: idCard)
            return Customer.createCustomer(name, idCard: idCard)
        }
        return instance
    }
    
    //添加用户
    static func addCustomer(name: String, idCard: String) {
        Customer(name: name, idCard: idCard).store()
    }
    
    //存储用户
    private func store() {
        Customer.customers[self.getIdCard()] = self
    }
}

class Order {
    private var customer: Customer

    init(customerName: String, idCard: String) {
        self.customer = Customer.createCustomer(customerName, idCard: idCard)
    }

    func setCustomer(customerName: String, idCard: String) {
        self.customer = Customer.createCustomer(customerName, idCard: idCard)
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

dump(Customer.customers)
