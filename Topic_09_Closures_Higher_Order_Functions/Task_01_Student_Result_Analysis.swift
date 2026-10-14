struct Student {
    let name: String
    let marks: Int
    let dept: String
}
let students = [
    Student(name: "Asha", marks: 82, dept: "IT"),
    Student(name: "Ravi", marks: 35, dept: "CSE"),
    Student(name: "Meena", marks: 91, dept: "IT"),
    Student(name: "Kiran", marks: 56, dept: "ECE"),
    Student(name: "Divya", marks: 67, dept: "CSE"),
    Student(name: "Arjun", marks: 40, dept: "IT")
]
let passed = students.filter { student in student.marks >= 40 }
print("Passed: \(passed.map { $0.name })")
print("Passed (shorthand): \(students.filter { $0.marks >= 40 }.map(\.name))")
let average = Double(students.map(\.marks).reduce(0, +)) / Double(students.count)
print("Class average: \(average)")
let ranked = students.sorted { $0.marks > $1.marks }
print("Ranked: \(ranked.map { "\($0.name): \($0.marks)" })")
let byDepartment = Dictionary(grouping: students, by: \.dept)
for department in byDepartment.keys.sorted() {
    print("\(department): \(byDepartment[department]!.map(\.name))")
}
