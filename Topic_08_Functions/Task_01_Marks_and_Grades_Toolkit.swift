func average(of marks: Int...) -> Double {
    guard !marks.isEmpty else { return 0 }
    return Double(marks.reduce(0, +)) / Double(marks.count)
}
func grade(for average: Double) -> String {
    switch average {
    case 90...: return "O"
    case 80..<90: return "A+"
    case 70..<80: return "A"
    case 60..<70: return "B"
    default: return "RA"
    }
}
func stats(of marks: [Int]) -> (min: Int, max: Int, average: Double)? {
    guard let minimum = marks.min(), let maximum = marks.max() else { return nil }
    return (minimum, maximum, Double(marks.reduce(0, +)) / Double(marks.count))
}
func curve(_ marks: inout [Int], by bonus: Int = 5) {
    marks = marks.map { min(100, $0 + bonus) }
}
print("Average: \(average(of: 80, 90, 75))")
print("Grade: \(grade(for: average(of: 80, 90, 75)))")
if let result = stats(of: [80, 90, 75]) {
    print("Min: \(result.min), max: \(result.max), average: \(result.average)")
}
var marks = [78, 96, 99]
curve(&marks)
print("Curved marks: \(marks)")
