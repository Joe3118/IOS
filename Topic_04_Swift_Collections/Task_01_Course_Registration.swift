var subjects = ["Swift", "UIKit", "SwiftUI"]
subjects.append("Networking")
subjects.insert("Testing", at: 1)
if let index = subjects.firstIndex(of: "UIKit") {
    subjects.remove(at: index)
}
print("Sorted subjects: \(subjects.sorted())")
var registered: Set<String> = ["Asha", "Ravi"]
registered.insert("Asha")
registered.insert("Asha")
print("Unique registered students: \(registered.count)")
var marks = ["Asha": 90, "Ravi": 75, "Meena": 88]
marks["Kiran"] = 82
marks["Ravi"] = 80
print("Kiran's mark: \(marks["Kiran"] as Any)")
print("Missing student's mark: \(marks["Dev"] as Any)")
for name in marks.keys.sorted() {
    print("\(name): \(marks[name]!)")
}
if let top = marks.max(by: { $0.value < $1.value }) {
    print("Highest mark: \(top.value), student: \(top.key)")
}
