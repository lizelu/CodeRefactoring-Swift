/////////////////////最原始的代码，需要重构/////////////////////////////

/**
 *电影
 */
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
        var totalAmount: Double = 0                     //总金额
        var frequentRenterPoints: Int = 0               //用户积分
        var result: String = "\(self.name)的租赁账单:\n"

        for rental:Rental in self.rentals {

            var thisAmount:Double = 0       //单价变量

            switch rental.movie.priceCode {
            case Movie.REGULAR:
                thisAmount += 2
                if rental.daysRented > 2 {
                    thisAmount += Double(rental.daysRented - 2) * 1.5
                }
            case Movie.NEW_RELEASE:
                thisAmount += Double(rental.daysRented * 3)
            case Movie.CHILDRENS:
                thisAmount += 1.5
                if rental.daysRented > 3 {
                    thisAmount += Double(rental.daysRented - 3) * 1.5
                }
            default:
                break
            }

            //计算积分
            frequentRenterPoints++
            if rental.movie.priceCode == Movie.NEW_RELEASE &&
                rental.daysRented > 1{
                    frequentRenterPoints++
            }

            //展示result
            result += "\t\(rental.movie.title)\t\(thisAmount)\n"

            //计算总金额
            totalAmount += thisAmount
        }

        result += "总金额为：\(totalAmount)\n"
        result += "你本次出借获取的积分为：\(frequentRenterPoints)"

        return result
    }
}

