////////////////第五次重构，使用状态模式进行重构//////////////////////////

/**
*添加价格接口，在价格接口中有三个方法
*/
protocol Price {
    func getPriceCode() -> Int;
    func getCharge(daysRented: Int) -> Double;
    func getFrequentRenterPoints(daysRented:Int) -> Int;
}

class RegularPrice: Price {
    func getPriceCode() -> Int {
        return Movie.REGULAR
    }
    
    func getCharge(daysRented: Int) -> Double {
        var result:Double = 2       //单价变量
        if daysRented > 2 {
            result += Double(daysRented - 2) * 1.5
        }
        return result
    }
    
    func getFrequentRenterPoints(daysRented:Int) -> Int {
        return 1
    }
}

class NewReleasePrice: Price {
    func getPriceCode() -> Int {
        return Movie.NEW_RELEASE
    }
    
    func getCharge(daysRented: Int) -> Double {
        return Double(daysRented * 3)
    }
    
    func getFrequentRenterPoints(daysRented:Int) -> Int{
        return (daysRented > 1) ? 2 : 1
    }
}

class ChildrensPrice: Price {
    func getPriceCode() -> Int {
       return Movie.CHILDRENS
    }
    
    func getCharge(daysRented: Int) -> Double {
        var result:Double = 1.5       //单价变量
        if daysRented > 3 {
            result += Double(daysRented - 3) * 1.5
        }
        return result
    }
    
    func getFrequentRenterPoints(daysRented:Int) -> Int {
        return 1
    }
}


class Movie {
    //电影的种类
    static let REGULAR: Int = 0         //普通片儿
    static let NEW_RELEASE: Int = 1     //儿童片儿
    static let CHILDRENS: Int = 2       //新片儿
    
    let title: String                   //电影名称
    var priceCode: Int = 0              //价格代码
    
    private var price: Price!=nil       //价格对象
    
    init(title: String, priceCode: Int) {
        self.title = title
        setPriceCode(priceCode)
    }
    
    func setPriceCode(priceCode:Int) {
        self.priceCode = priceCode
        switch priceCode {
        case Movie.REGULAR:
            self.price = RegularPrice()
        case Movie.NEW_RELEASE:
            self.price = NewReleasePrice()
        case Movie.CHILDRENS:
            self.price = ChildrensPrice()
        default:
            break
        }
        print(self.price.getPriceCode())
    }
    
    func getCharge(daysRented:Int) -> Double {
        return self.price.getCharge(daysRented)
    }
    
    func getFrequentRenterPoints(daysRented:Int) -> Int {
        return self.price.getFrequentRenterPoints(daysRented)
    }
}

/**
 *租赁
 */
class Rental {
    let movie: Movie        //租赁的电影
    let daysRented: Int     //租赁的时间
    
    init(movie: Movie, daysRented: Int) {
        self.movie = movie
        self.daysRented = daysRented
    }
    
    func getCharge() -> Double {
        return self.movie.getCharge(self.daysRented)
    }
    
    func getFrequentRenterPoints() -> Int {
        return self.movie.getFrequentRenterPoints(self.daysRented)
    }
}


/**
 *顾客
 */
 
 /**
 *价格计算规则：
 *      普通片儿--2天之内含2天，每部收费2元，超过2天的部分每天收费1.5元
 *      新片儿--每天每部3元
 *      儿童片--3天之内含3天，每部收费1.5元，超过3天的部分每天收费1.5元
 *积分计算规则：
 *      每借一步电影积分加1，新片每部加2
 */
class Customer {
    let name: String                 //用户名字
    private var rentals: Array<Rental> = []  //用户所租赁的电影
    
    init(name: String) {
        self.name = name
    }
    
    func addRental(rental: Rental) {
        self.rentals.append(rental)
    }
    
    func statement() -> String {
        var result: String = "\(self.name)的租赁账单:\n"
        
        for rental:Rental in self.rentals {
            //展示result
            result += "\t\(rental.movie.title)\t\(rental.getCharge())\n"
        }
        
        result += "总金额为：\(getTotalCharge())\n"
        result += "你本次出借获取的积分为：\(getTotalFraquentRenterPoints())"
        
        return result
    }
    
    
    
    //添加支持输出HTML的代码
    func htmlStatement() -> String {
        var result: String = "<h1><em>\(self.name)</em>的租赁账单:</h1>\n"
        
        for rental:Rental in self.rentals {
            //展示result
            result += "\(rental.movie.title):\(rental.getCharge())</br>\n"
        }
        
        result += "<p>总金额为：<em>\(getTotalCharge())</em></p>\n"
        result += "<p>你本次出借获取的积分为：<em>\(getTotalFraquentRenterPoints())</em></p>"
        
        return result
    }
    
    
    //提取总额计算代码
    func getTotalCharge() -> Double{
        var result:Double = 0
        for rental:Rental in self.rentals {
            result += rental.getCharge()
        }
        return result
    }
    
    //提取总积分计算代码
    func getTotalFraquentRenterPoints() -> Int{
        var result:Int = 0
        for rental:Rental in self.rentals {
            result += rental.getFrequentRenterPoints()
        }
        return result
    }
}


//测试用例--------------------------------------------------------------------
//创建用户
let customer = Customer(name: "ZeluLi")

//创建电影
let regularMovie:Movie = Movie(title: "《老炮儿》", priceCode: Movie.REGULAR)
let newMovie:Movie = Movie(title: "《福尔摩斯》", priceCode: Movie.NEW_RELEASE)
let childrenMovie:Movie = Movie(title: "《葫芦娃》", priceCode: Movie.CHILDRENS)

//创建租赁数据
let rental1:Rental = Rental(movie: regularMovie, daysRented: 5)
let rental2:Rental = Rental(movie: newMovie, daysRented: 8)
let rental3:Rental = Rental(movie: childrenMovie, daysRented: 2)

customer.rentals.append(rental1)
customer.rentals.append(rental2)
customer.rentals.append(rental3)

let result = customer.statement()
print(result)
