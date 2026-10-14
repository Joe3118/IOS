struct Stack<Element> {
    private var items: [Element] = []
    mutating func push(_ item: Element) { items.append(item) }
    mutating func pop() -> Element? { items.popLast() }
    var top: Element? { items.last }
    var isEmpty: Bool { items.isEmpty }
    var count: Int { items.count }
}
func largest<T: Comparable>(in items: [T]) -> T? {
    items.max()
}
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temporary = a
    a = b
    b = temporary
}
var numbers = Stack<Int>()
numbers.push(10)
numbers.push(20)
print("Int stack top: \(numbers.top as Any), count: \(numbers.count)")
print("Popped: \(numbers.pop() as Any)")
var words = Stack<String>()
words.push("Swift")
words.push("Generics")
print("String stack top: \(words.top as Any)")
print("Largest integer: \(largest(in: [4, 9, 2]) as Any)")
print("Largest string: \(largest(in: ["apple", "pear", "banana"]) as Any)")
var first = 1
var second = 99
swapValues(&first, &second)
print("Swapped: \(first), \(second)")
