let sentence = "swift is fun and swift is fast"
let words = sentence.split(separator: " ").map(String.init)
let uniqueWords = Set(words)
var frequency: [String: Int] = [:]
for word in words {
    frequency[word, default: 0] += 1
}
let ranked = frequency.sorted {
    if $0.value == $1.value { return $0.key < $1.key }
    return $0.value > $1.value
}
print("Word count: \(words.count)")
print("Unique words: \(uniqueWords.sorted())")
print("Frequencies: \(frequency)")
print("Ranked words: \(ranked.map { "\($0.key): \($0.value)" })")
