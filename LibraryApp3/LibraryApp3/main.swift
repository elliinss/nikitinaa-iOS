import Foundation

enum Genre: String {
    case fiction = "Фантастика"
    case detective = "Детектив"
    case classic = "Классика"
    case nonfiction = "Нон-фикшн"
}

protocol Printable {
    func printInfo()
}

struct Book: Printable {
    let title: String
    let author: String
    let year: Int
    let pageCount: Int
    var isAvailable: Bool = true
    let genre: Genre
    
    var shortDescription: String {
        return "\(title) - \(author) (\(pageCount) стр.)"
    }
    
    func printInfo() {
        print("Название: \(title)")
        print("Автор: \(author)")
        print("Год: \(year)")
        print("Страниц: \(pageCount)")
        print("Жанр: \(genre.rawValue)")
        print("Доступна: \(isAvailable ? "Да" : "Нет")")
        print("---")
    }
}

class Library {
    private var books: [Book]
    
    init(books: [Book] = []) {
        self.books = books
    }
    
    func findBook(byTitle title: String) -> Book? {
        return books.first {
            $0.title.lowercased() == title.lowercased()
        }
    }
    
    func findBooks(byAuthor author: String) -> [Book] {
        return books.filter {
            $0.author.lowercased() == author.lowercased()
        }
    }
    
    func issueBook(byTitle title: String) {
        guard let index = books.firstIndex(where: {
            $0.title.lowercased() == title.lowercased() }) else
        {
            print("Книга не найдена")
            return
        }
        guard books[index].isAvailable else {
            print("Книга уже выдана")
            return
        }
        books[index].isAvailable = false
        print("Книга выдана")
    }
    
    func getBooks(byGenre genre: Genre) -> [Book] {
        return books.filter { $0.genre == genre }
    }
    
    func getSortedBooks(byPageCount ascending: Bool = true) -> [Book] {
        return books.sorted { ascending ? $0.pageCount < $1.pageCount : $0.pageCount > $1.pageCount }
    }
    
    func getAllTitles() -> [String] {
        return books.map { $0.title }
    }
    
    func getTotalPageCount() -> Int {
        return books.reduce(0) { $0 + $1.pageCount }
    }
    
    func printAllBooks() {
        books.forEach { $0.printInfo() }
    }
    
    static func createTestLibrary() -> Library {
        return Library(books: [
            Book(title: "1984", author: "Джордж Оруэлл", year: 1949, pageCount: 328, genre: .fiction),
            Book(title: "Война и мир", author: "Лев Толстой", year: 1869, pageCount: 1225, genre: .classic),
            Book(title: "Преступление и наказание", author: "Фёдор Достоевский", year: 1866, pageCount: 720, genre: .classic),
            Book(title: "Маленький принц", author: "Антуан де Сент-Экзюпери", year: 1943, pageCount: 96, genre: .classic),
            Book(title: "Собака Баскервилей", author: "Артур Конан Дойл", year: 1902, pageCount: 256, genre: .detective),
            Book(title: "Дюна", author: "Фрэнк Герберт", year: 1965, pageCount: 688, genre: .fiction),
            Book(title: "Убийство в Восточном экспрессе", author: "Агата Кристи", year: 1934, pageCount: 288, genre: .detective),
            Book(title: "Разумный инвестор", author: "Бенджамин Грэм", year: 1949, pageCount: 640, genre: .nonfiction)
        ])
    }
}

extension Library {
    func getTopThreeBooks() -> [Book] {
        let sortedBooks = books.sorted { firstBook, secondBook in
            firstBook.pageCount > secondBook.pageCount
        }
        let result = Array(sortedBooks.prefix(3))
        return result
    }
}

let library = Library.createTestLibrary()

print("Все книги:")
library.printAllBooks()

print("\nПоиск по названию '1984':")
if let book = library.findBook(byTitle: "1984") {
    print(book.shortDescription)
}

print("\nПоиск по автору 'Лев Толстой':")
library.findBooks(byAuthor: "Лев Толстой").forEach { print($0.shortDescription) }

print("\nВыдача книги '1984':")
library.issueBook(byTitle: "1984")

print("\nКниги жанра 'Классика':")
library.getBooks(byGenre: .classic).forEach { print($0.shortDescription) }

print("\nСписок названий:")
library.getAllTitles().forEach { print($0) }

print("\nОбщее количество страниц: \(library.getTotalPageCount())")

print("\nТри самые объёмные книги:")
library.getTopThreeBooks().forEach { print($0.shortDescription) }
