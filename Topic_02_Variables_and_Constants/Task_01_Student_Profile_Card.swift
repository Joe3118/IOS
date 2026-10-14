import Foundation
let studentName = "Joe"
let rollNumber: Int = 2301
var semester: Int = 5
var cgpa: Double = 8.51
let isHosteller: Bool = false
print("Name: \(studentName), Roll: \(rollNumber), Semester: \(semester)")
semester += 1
cgpa = 8.60
print("Name: \(studentName), Roll: \(rollNumber), Semester: \(semester), CGPA: \(cgpa)")
print(type(of: studentName))
print(type(of: rollNumber))
print(type(of: semester))
print(type(of: cgpa))
print(type(of: isHosteller))
