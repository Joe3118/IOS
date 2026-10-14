enum ATMError: Error {
    case insufficientFunds(shortBy: Double)
    case invalidAmount
    case dailyLimitExceeded
}
struct Account {
    var balance: Double
    private(set) var withdrawnToday: Double = 0
    let dailyLimit: Double = 20_000
    mutating func withdraw(_ amount: Double) throws {
        guard amount > 0 else { throw ATMError.invalidAmount }
        guard amount <= dailyLimit - withdrawnToday else {
            throw ATMError.dailyLimitExceeded
        }
        guard amount <= balance else {
            throw ATMError.insufficientFunds(shortBy: amount - balance)
        }
        balance -= amount
        withdrawnToday += amount
    }
}
var account = Account(balance: 10_000)
for amount in [500.0, -10.0, 25_000.0, 12_000.0] {
    do {
        try account.withdraw(amount)
        print("Withdrew ₹\(amount). Balance: ₹\(account.balance)")
    } catch ATMError.invalidAmount {
        print("Error: amount must be positive.")
    } catch ATMError.dailyLimitExceeded {
        print("Error: daily withdrawal limit exceeded.")
    } catch ATMError.insufficientFunds(let shortBy) {
        print("Error: insufficient funds; short by ₹\(shortBy).")
    } catch {
        print("Unexpected error: \(error)")
    }
}
let optionalResult = try? account.withdraw(100)
print("Optional withdrawal result: \(optionalResult as Any)")
