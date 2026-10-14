let scores = ["Asha": 90, "Ravi": 72]
if let kiran = scores["Kiran"] {
    print("Kiran's score: \(kiran)")
} else {
    print("No score found for Kiran.")
}
if let number = Int("12a") {
    print("Number: \(number)")
} else {
    print("The supplied text is not a valid integer.")
}
