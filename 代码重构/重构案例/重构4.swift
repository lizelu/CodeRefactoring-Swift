////////////////第四次重构，将Switch语句已到Movie当中，因为一个对象最好不要在另一个对象的基础上使用Switch语句//////////////////////////
class Movie {
    //电影的种类
    static let REGULAR: Int = 0         //普通片儿
    static let NEW_RELEASE: Int = 1     //儿童片儿
    static let CHILDRENS: Int = 2       //新片儿
    
    var priceCode: Int                  //价格代码
    let title: String                   //电影名称
    
    
    init(title: String, priceCode: Int) {
        self.title = title
        self.priceCode = priceCode
    }
    
     //根据租赁订单，计算当前电影的金额
    func getCharge(daysRented:Int) -> Double {
        
        var result:Double = 0       //单价变量
        
        switch self.priceCode {
        case Movie.REGULAR:
            result += 2
            if daysRented > 2 {
                result += Double(daysRented - 2) * 1.5
            }
        case Movie.NEW_RELEASE:
            result += Double(daysRented * 3)
        case Movie.CHILDRENS:
            result += 1.5
            if daysRented > 3 {
                result += Double(daysRented - 3) * 1.5
            }
        default:
            break
        }
        return result
    }
    
     //计算当前电影的积分
    func getFrequentRenterPoints(daysRented:Int) -> Int {
        //第六次重构
        if self.priceCode == Movie.NEW_RELEASE && daysRented > 1{
            return 2
        }
        return 1
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
     //根据租赁订单，计算当前电影的金额
    func getCharge() -> Double {
        return self.movie.getCharge(self.daysRented)
    }
    
     //计算当前电影的积分
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
    
    
    
    //第五：添加支持输出HTML的代码
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
