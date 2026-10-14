protocol Entity {
    var id: Int { get }
}
protocol Describable {
    var summary: String { get }
}
struct Student: Entity, Describable {
    let id: Int
    let name: String
    let marks: Int
    var summary: String { "Student #\(id): \(name), marks \(marks)" }
}
struct Course: Entity, Describable {
    let id: Int
    let title: String
    var summary: String { "Course #\(id): \(title)" }
}
struct Repository<T: Entity> {
    private var storage: [Int: T] = [:]
    mutating func add(_ item: T) { storage[item.id] = item }
    func all() -> [T] { storage.values.sorted { $0.id < $1.id } }
}
extension Repository where T: Describable {
    func printReport() {
        all().forEach { print($0.summary) }
    }
}
var studentRepository = Repository<Student>()
studentRepository.add(Student(id: 1, name: "Asha", marks: 91))
studentRepository.add(Student(id: 2, name: "Ravi", marks: 75))
studentRepository.printReport()
var courseRepository = Repository<Course>()
courseRepository.add(Course(id: 101, title: "Swift Programming"))
courseRepository.printReport()
