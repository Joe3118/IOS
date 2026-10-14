import Foundation
protocol Payable {
    var name: String { get }
    func monthlyPay() -> Double
}
extension Payable {
    func payslip() -> String {
        return "\(name)'s monthly pay: ₹\(String(format: "%.2f", monthlyPay()))"
    }
}
struct FullTimeEmployee: Payable {
    let name: String
    let annualSalary: Double
    func monthlyPay() -> Double { annualSalary / 12 }
}
struct Intern: Payable {
    let name: String
    let monthlyStipend: Double
    func monthlyPay() -> Double { monthlyStipend }
}
struct Contractor: Payable {
    let name: String
    let hourlyRate: Double
    let hours: Double
    func monthlyPay() -> Double { hourlyRate * hours }
}
let workers: [any Payable] = [
    FullTimeEmployee(name: "Asha", annualSalary: 600_000),
    Intern(name: "Ravi", monthlyStipend: 18_000),
    Contractor(name: "Meena", hourlyRate: 500, hours: 80)
]
workers.forEach { print($0.payslip()) }
