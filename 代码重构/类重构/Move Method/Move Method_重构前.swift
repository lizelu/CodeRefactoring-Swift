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
}

class BookCustomer {
    let name:String
    let isVip:Bool
    var books:Array<Book> = []
    
    init(name:String, isVip:Bool) {
        self.name = name
        self.isVip = isVip
    }
    
    func charge() -> Double {
        var result:Double = 0
        
        for book in books {
            var singel:Double = 0
            switch book.bookCode {
                case Book.NEW_BOOK:
                    singel += 10
                case Book.OLD_BOOK:
                    singel += 5
                case Book.CHIDREN_BOOK:
                    singel += 3
                default:
                    break;
            }
            result += singel
        }
        
        if isVip {
            result *= 0.7
        } else {
            result *= 0.9
        }
        
        return result
    }
}

let bookCustomer = BookCustomer(name: "ZeluLi", isVip: true)

bookCustomer.books.append(Book(bookCode: 0, bookName: "《Book Name 1》"))
bookCustomer.books.append(Book(bookCode: 1, bookName: "《Book Name 2》"))
bookCustomer.books.append(Book(bookCode: 2, bookName: "《Book Name 3》"))

print(bookCustomer.charge())

