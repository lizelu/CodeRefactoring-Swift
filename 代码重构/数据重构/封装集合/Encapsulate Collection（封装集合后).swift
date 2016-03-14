//上面这种封装的就不好，特别难用
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
    private var lendBooks: Dictionary<String, LibraryBook> = Dictionary()
    
    init(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }
    
    
    func getLendBooks() -> Dictionary<String, LibraryBook> {
        return self.lendBooks
    }
    
    //为相应的集合添加相应的操作方法
    func addBook(bookName: String) {
        self.lendBooks[bookName] = LibraryBook(name: bookName)
    }
    
    func removeBook(bookName: String) {
        self.lendBooks.removeValueForKey(bookName)
    }
    
    func removeAllBooks() {
        self.lendBooks.removeAll()
    }
}

var bookLender = Lender(name: "Zeluli")

bookLender.addBook("《雪碧加盐》")
bookLender.addBook("《福尔摩斯》")

bookLender.getLendBooks()
bookLender.removeBook("《福尔摩斯》")
bookLender.getLendBooks()
