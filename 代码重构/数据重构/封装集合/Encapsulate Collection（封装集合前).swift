class LibraryBook {
    private var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }
}

class Lender {
    private var name: String
    private var lendBooks: Array<LibraryBook> = []
    
    init(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }
    
    func setLendBooks(books: Array<LibraryBook>) {
        self.lendBooks = books
    }
    
    func getLendBooks() -> Array<LibraryBook> {
        return self.lendBooks
    }
}

//先创建一个书籍数组
var books: Array<LibraryBook> = []
//添加要借的书籍
books.append(LibraryBook(name: "《雪碧加盐》"))
books.append(LibraryBook(name: "《格林童话》"))
books.append(LibraryBook(name: "《智慧意林》"))

//创建借书人
let lender: Lender = Lender(name: "ZeluLi")
lender.setLendBooks(books)

//获取所借书籍
var myBooks = lender.getLendBooks()

//对书籍数组修改后再赋值回去
myBooks.removeFirst()
lender.setLendBooks(myBooks)
