import Foundation
var price = 250
let quantity: Int = 3
let taxRate = 0.18
price = 300
let subtotal = Double(price * quantity)
let total = subtotal * (1 + taxRate)
var title = "Order"
title = "Updated Order"
print("\(title) total including tax: \(String(format: "%.2f", total))")
