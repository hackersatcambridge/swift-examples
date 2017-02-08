print("See the source for how to use enums in Swift\n")

// This defines an enumeration with 4 possible values
// This represents the group of possible suits of a playing card
// Note that the capital enum name and the lowercase case names is conventional
enum CardSuit {
  case spades, clubs, hearts, diamonds
}

// Try setting different values of 
let someSuit: CardSuit = .spades

switch someSuit {
case CardSuit.spades:
  print("Spades")
case CardSuit.clubs:
  print("Clubs")
case CardSuit.hearts:
  print("Hearts")
case CardSuit.diamonds:
  print("Diamonds")
}
// Notice that we do not need to add a default case here, 
// The compiler knows that these cases cover all possible cases for this enum
// Cool!


// We can simplify the above code
// Since the compiler knows that someSuit is of type CardSuit, we can write this:
switch someSuit {
case .spades:
  print("Spades")
case .clubs:
  print("Clubs")
case .hearts:
  print("Hearts")
case .diamonds:
  print("Diamonds")
}

// enums can even have functions
// Let's add this switch as a description function on the enum
extension CardSuit {
  func description() -> String {
    switch self {
    case .spades:
      return "Spades"
    case .clubs:
      return "Clubs"
    case .hearts:
      return "Hearts"
    case .diamonds:
      return "Diamonds"
    }
  }
}

// enums can have associated values
enum Price {
  // Can either have a value or not yet have a set value
  // If it has a value, associate an Int with it to represent the number of pence the item costs
  case value(Int)
  case unconfirmed

  func description() -> String {
    switch self {
    case .value(let x):
      // Notice we use the let keyword to bind a constant to the integer associate with the .value case
      // Then we can use the constant inside the case
      return "Price is \(x) pence"
    case .unconfirmed:
      return "See the blackboard for the price"
    }
  }
}

let caviarPrice = Price.value(2300)
let potatoPrice = Price.value(10)
print(caviarPrice.description())

let soupOfTheDayPrice = Price.unconfirmed
print(soupOfTheDayPrice.description())
