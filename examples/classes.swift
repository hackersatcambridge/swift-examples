print("See the source for comparison of classes and structs in Swift\n")


// We define a Student as a class
class Student {
  let name: String
  var triposPart: String
  func read() {
    print("My name is \(name) and I am reading!!!")
  }
  // Provide an initialiser
  init(name: String, triposPart: String) {
    // Note the use of the `self` keyword here
    // self.name refers to the stored property name
    // whereas name refers to the parameter to the initialiser
    // only need 'self.' because of the ambiguity
    self.name = name
    self.triposPart = triposPart
  }
}

// We can make an object from a class like so
// This is using the initialiser we just wrote
let richard = Student(name: "Richard", triposPart: "1B")
richard.read()

// Classes are 'pass-by-reference'
// This means here when we set otherRichard equal to richard,
// otherRichard is now another reference to the *same* Student object
var otherRichard = richard
otherRichard.triposPart = "1A"

print(richard.triposPart)
// prints 1A
// Maybe not what we want!

// Here we define Instructor as a struct
struct Instructor {
  let name: String
  var module: String
  init(name: String, lecturingIn module: String) {
    self.name = name
    self.module = module
  }
  func teach() {
      print("My name is \(name) and I am teaching! Roar!")
  }
}

let hal = Instructor(name: "Hal", lecturingIn: "Swift")
hal.teach()

var otherInstructor = hal
otherInstructor.module = "Digital Electronics"
// hal.module == "Swift"
// Hal is untouched, Yay!
