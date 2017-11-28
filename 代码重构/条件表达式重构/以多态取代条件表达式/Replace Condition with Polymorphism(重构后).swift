//使用多态进行重构
protocol Price {
    func charge() -> Double
}

class NewBookPrice: Price {
    func charge() -> Double {
        return 10   //假设这里是一些超复杂的计算
    }
}

class OldBookPrice: Price {
    func charge() -> Double {
        return 5    //假设这里是一些超复杂的计算
    }
}

class ChildrenBookPrice: Price {
    func charge() -> Double {
        return 3    //假设这里是一些超复杂的计算
    }
}

class Book {
    static let NEW_BOOK = 0
    static let OLD_BOOK = 1
    static let CHIDREN_BOOK = 2
    
    var bookCode:Int = 0
    var bookName:String
    var price: Price? = nil
    
    init(bookCode:Int, bookName:String) {
        self.bookName = bookName
        self.setBookCode(bookCode: bookCode)
    }
    
    private func setBookCode(bookCode: Int) {
        self.bookCode = bookCode
        switch self.bookCode {
        case Book.NEW_BOOK:
            self.price = NewBookPrice()
        case Book.OLD_BOOK:
            self.price = OldBookPrice()
        case Book.CHIDREN_BOOK:
            self.price = ChildrenBookPrice()
        default:
            break;
        }
        
    }
    
    func charge() -> Double {
        return self.price!.charge()
    }
    
}

//let book = Book(bookCode: Book.NEW_BOOK, bookName: "《福尔摩斯》")
//book.charge()
