let entries = ["10", "x", "25", "", "7.5", "40"]
let validIntegers = entries.compactMap { Int($0) }
let invalidCount = entries.count - validIntegers.count
let sum = validIntegers.reduce(0, +)
let firstDoubled = validIntegers.first.map { $0 * 2 }
print("Valid integers: \(validIntegers)")
print("Sum: \(sum)")
print("Invalid entries: \(invalidCount)")
print("First valid number doubled: \(firstDoubled as Any)")
