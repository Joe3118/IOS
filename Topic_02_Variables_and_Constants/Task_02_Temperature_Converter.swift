import Foundation
let fahrenheitMultiplier = 9.0 / 5.0
let fahrenheitOffset = 32.0
let kelvinOffset = 273.15
var celsius = 25.0
func printTemperatures(celsius: Double) {
    let fahrenheit = celsius * fahrenheitMultiplier + fahrenheitOffset
    let kelvin = celsius + kelvinOffset
    print("Celsius: \(String(format: "%.1f", celsius)) °C")
    print("Fahrenheit: \(String(format: "%.1f", fahrenheit)) °F")
    print("Kelvin: \(String(format: "%.1f", kelvin)) K")
}
printTemperatures(celsius: celsius)
celsius = 0
print("--- Updated temperature ---")
printTemperatures(celsius: celsius)
