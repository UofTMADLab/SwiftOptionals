//Swift Session 1 - Optionals

import UIKit

print(Int(arc4random_uniform(5) + 1))
print(Int(arc4random_uniform(5) + 1))
print(Int(arc4random_uniform(5) + 1))
print(Int(arc4random_uniform(5) + 1))
print(Int(arc4random_uniform(5) + 1))



// Declaring variables in Swift
var anInteger: Int  = 10
var aString: String = "Hi!"

// Variables are 'typed'. You can only assign values of the correct type.

//Error:
//anInteger = aString

// Composite types like Arrays and Dictionaries an only hold values of the types they are declared with.
var anArrayOfStrings: Array<String> = Array<String>()
var anotherArrayOfStrings: [String] = [String]()

var aDictionary: Dictionary<String, Int> = Dictionary<String,Int>()
var anotherDictionary: [String: Int] = [String: Int]()

// Optionals are distinct types, but are related  to the type they wrap.
// Declaring optional variablesin Swift:
var anOptionalInteger: Int? = nil
var anotherOptionalInteger: Optional<Int> = nil

//Error: Cannot assign an optional to a non-optional variable.
// They are different types!
//anInteger = anOptionalInteger

// But luckily I can assign a regular value to an optional variable
anOptionalInteger = anInteger


// Arrays and Dictionaries can be wrapped as Optionals or can hold optionals in their storage.
var anOptionalArray: [String]? = nil
var anotherOptionalArray: Optional<[String]> = nil

var anArrayOfOptionals: [String?] = ["hello", "bonjour", nil, nil, "goodbye"]

//////
// Where does 'nil' come from, and why do we have to deal with it?

// Failed initializers:
let failedInt = Int("doh")
let maybeInt = Int("123")

// Dictionary values:
let definitions: Dictionary<String, String> =

["swift": "a new programming language by Apple",
"playground": "a place where you can try out swift"]

let swiftDefinition = definitions["swift"]
let objectiveCDefinition = definitions["objective-c"]

// Initializers that depend on outside resources:
let myImage = UIImage(named:"FileThatDoesNotExist")

////
// So how do we get the value out of an Optional and turn it into a real value.

// Check for nil and force unwrap using !
if maybeInt != nil {
    let forSure = maybeInt!
    print (forSure + 198)
}

// Use 'optional binding' which is fancy shortcut syntax to assign the value to a constant.
if let forSure = maybeInt {
    print (forSure + 198)
}
////
// Function parameters
// We can print an optional, since print can accept nil as its parameter
print (swiftDefinition)

// Your own functions can accept optional parameters too:
func printUpperCase(anOptionalString: String?) {
    if let string = anOptionalString {
        print (string.uppercaseString)
    } else {
        print ("No definition found.")
    }
}
printUpperCase(swiftDefinition)
printUpperCase(objectiveCDefinition)
printUpperCase(aString) // can also pass a concrete value

/////
// Optional chaining

// Using 'optional binding' and if statements can get cumbersome:
if let definition = swiftDefinition {
    print (definition.uppercaseString)
}

// Error - can't directly access members of an Optional's wrapped class
//print (swiftDefinition.uppercaseString)

// shortcut is to use optional chaining
print (swiftDefinition?.uppercaseString)
print (objectiveCDefinition?.uppercaseString)

// result of the expression is always an optional itself
let myDefinition = objectiveCDefinition?.characters.count

////
// Nil coalescing operator
// Here is a shortcut if you want to return a default value when the optional is nil

// These two statements are equivalent:
let definitionOrDefault1 = swiftDefinition != nil ? swiftDefinition! : "No definition found."
// Here is the shorter version
let definitionOrDefault2 = objectiveCDefinition ?? "No definition found."


////
// You can also declare variables as implicitly unwrapped if they will never have a nil value. They are still optionals, but you don't have to explicitly unwrap them.

var implicitlyUnwrapped: Int!

// Useful in class definitions that will not have all properties assigned at initialization, but nevetheless will definitely have a value whevever the property is accessed

// Error: not initialized yet with a value!
print (implicitlyUnwrapped)

implicitlyUnwrapped = 42
print (implicitlyUnwrapped)
print (implicitlyUnwrapped.advancedBy(13))

////
// Source Reference
//https://github.com/apple/swift/blob/master/stdlib/public/core/Optional.swift



