func myFilter(_ items: [Int], _ predicate: (Int) -> Bool) -> [Int] {
    var result: [Int] = []
    for item in items where predicate(item) {
        result.append(item)
    }
    return result
}
func applyTwice(_ value: Int, _ f: (Int) -> Int) -> Int {
    return f(f(value))
}
final class Button {
    private var handlers: [() -> Void] = []
    func onTap(_ handler: @escaping () -> Void) {
        handlers.append(handler)
    }
    func tap() {
        handlers.forEach { $0() }
    }
}
print("Even numbers: \(myFilter([1, 2, 3, 4, 5, 6]) { $0 % 2 == 0 })")
print("Apply twice: \(applyTwice(3) { $0 + 2 })")
let button = Button()
button.onTap { print("First handler called") }
button.onTap { print("Second handler called") }
button.tap()
