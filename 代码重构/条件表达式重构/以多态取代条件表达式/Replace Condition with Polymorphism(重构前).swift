//--------Replace Condition with Polymorphism(以多态取代条件表达式)------------
//现象：条件是对象的类型，根据对象的类型而选择不同的行为
//解决方案：将这个条件表达式的每个分支放进一个子类的覆写函数中，然后将原始函数声明为抽象函数

class Book {
    static let NEW_BOOK = 0
    static let OLD_BOOK = 1
    static let CHIDREN_BOOK = 2

    var bookCode:Int
    var bookName:String

    init(bookCode:Int, bookName:String) {
        self.bookCode = bookCode
        self.bookName = bookName
    }

    func charge() -> Double {
        var result:Double = 0
        switch self.bookCode {
            case Book.NEW_BOOK:
                result += 10      //假设这里是一些超复杂的计算
            case Book.OLD_BOOK:
                result += 5       //假设这里是一些超复杂的计算
            case Book.CHIDREN_BOOK:
                result += 3       //假设这里是一些超复杂的计算
            default:
                break;
        }
        return result
    }

}

