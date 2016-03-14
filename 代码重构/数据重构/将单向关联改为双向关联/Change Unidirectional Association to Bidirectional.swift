//===========Change Unidirectional Association to Bidirectional(将单向关联改为双向关联)=========
//现象：两个类都需要使用对方的特性，但其间只有一条单向连接。
//解决方案：添加一个反向指针，并修改函数能够同时更新两条连接。
class Customer {
    private var name: String
    private var idCard: String
    static private var customers: Dictionary<String, Customer> = Dictionary()
    
    //添加与Order关联的链，一个用户有多个订单
    private var orders:Array<Order> = []

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
    
    //====================添加==================
    func addOrder(order: Order) {
        self.orders.append(order)
    }
    
    func getOrders() -> Array<Order> {
        return self.orders
    }
}

class Order {
    private var customer: Customer

    init(customerName: String, idCard: String) {
        self.customer = Customer.createCustomer(customerName, idCard: idCard)
        self.customer.addOrder(self)
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

dump(order2.getCustome().orders)
