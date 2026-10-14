import Foundation
protocol Borrowable {
    var id: Int { get }
    var title: String { get }
    var isAvailable: Bool { get set }
}
struct Book: Borrowable {
    let id: Int
    let title: String
    let author: String
    var isAvailable = true
}
struct Magazine: Borrowable {
    let id: Int
    let title: String
    let issue: Int
    var isAvailable = true
}
enum LibraryError: Error {
    case itemNotFound(id: Int)
    case alreadyBorrowed(title: String)
    case limitReached(max: Int)
}
final class Member {
    let name: String
    private(set) var borrowedIDs: [Int] = []
    static let limit = 2
    init(name: String) { self.name = name }
    func recordBorrow(_ id: Int) throws {
        guard borrowedIDs.count < Self.limit else {
            throw LibraryError.limitReached(max: Self.limit)
        }
        borrowedIDs.append(id)
    }
    func recordReturn(_ id: Int) {
        borrowedIDs.removeAll { $0 == id }
    }
}
struct Catalog<Item: Borrowable> {
    private var items: [Int: Item] = [:]
    mutating func add(_ item: Item) { items[item.id] = item }
    mutating func checkout(id: Int, to member: Member) throws {
        guard var item = items[id] else { throw LibraryError.itemNotFound(id: id) }
        guard item.isAvailable else { throw LibraryError.alreadyBorrowed(title: item.title) }
        try member.recordBorrow(id)
        item.isAvailable = false
        items[id] = item
    }
}
var catalog = Catalog<Book>()
catalog.add(Book(id: 1, title: "Swift Guide", author: "A. Writer"))
catalog.add(Book(id: 2, title: "Data Structures", author: "B. Writer"))
catalog.add(Book(id: 3, title: "Networking", author: "C. Writer"))
let member = Member(name: "Joe")
do {
    try catalog.checkout(id: 1, to: member)
    print("Borrowed book 1")
    do {
        try catalog.checkout(id: 1, to: member)
    } catch {
        print("Second checkout failed: \(error)")
    }
    try catalog.checkout(id: 2, to: member)
    try catalog.checkout(id: 3, to: member)
} catch {
    print("Checkout failed: \(error)")
}
