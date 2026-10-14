struct Address {
    var city: String?
}
struct User {
    var name: String
    var age: Int?
    var address: Address?
}
func describe(_ user: User) -> String {
    guard let age = user.age else {
        return "\(user.name): age unknown"
    }
    let city = user.address?.city ?? "unknown city"
    return "\(user.name), age \(age), city: \(city)"
}
let complete = User(name: "Asha", age: 21, address: Address(city: "Coimbatore"))
let noAge = User(name: "Ravi", age: nil, address: Address(city: "Chennai"))
let noCity = User(name: "Meena", age: 20, address: Address(city: nil))
print(describe(complete))
print(describe(noAge))
print(describe(noCity))
print(Int("42") as Any)
print(Int("abc") as Any)
