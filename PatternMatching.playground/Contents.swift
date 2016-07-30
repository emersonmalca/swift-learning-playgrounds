//: Playground - noun: a place where people can play

import UIKit

/*
    PATTERN MATCHING
    You can match optionals, ranges, enums with associated values, types, etc.
    Works across loops, conditions and switch/case
    SWITCH uses pattern matching
 */


let name = "TwoStraws"
let password = "fr0sti3s"

switch (name, password) {
case ("Bilbo", "BAGG1N5"):
        print("Hello Bilbo")
case ("TwoStraws", "fr0sti3s"):
    print("Hello TwoStraws")
default:
    print("Authentication failed")
}



let user = (name: "TwoStraws", password: "fr0sti3s", ipAddress:"127.3.3.1")

switch (user) {
case ("Bilbo", "BAGG1N5", _):
    print("Hello Bilbo")
case ("TwoStraws", "fr0sti3s", _):
    print("Hello TwoStraws")
default:
    print("Authentication failed")
}



let shortUser = (name: "TwoStraws", password: "fr0sti3s")

switch (shortUser) {
case ("Bilbo", _):
    print("Hello Bilbo")
case ("TwoStraws",  let password):
    print("Hello TwoStraws, your password is \(password)")
default:
    print("Authentication failed")
}


//2 . We can even do checks and create tuples

// number number to force it showing up in autocompletion and when calling the function
func fizzbuzz(number number: Int) -> String {
    switch (number % 3 == 0, number % 5 == 0) {
    case (true, false):
        return "Fizz"
    case (false, true):
        return "Buzz"
    case (true, true):
        return "Fizz Buzz"
    default:
        return String(number)
    }
}

fizzbuzz(number: 8)

// 3.

let twostraws = (name: "twostraws", password: "blah")
let bilbo = (name: "bilbo", password: "blahB")
let taylor = (name: "taylor", password: "blahT")

let users = [twostraws, bilbo, taylor]

for case (let name, let password) in users {
    print("user \(name), has the password \(password)")
}

// Could be rewritten as
for case let (name, password) in users {
    print("user \(name), has the password \(password)")
}

// Other parttern matching
for case let (name, "blah") in users {
    print("user \(name), has the password blah")
}




// 4. Match optionals
let optionalName: String? = "twostraws"
let optionalPassword: String? = "blah"

switch (optionalName, optionalPassword) {
case let (.Some(unwrappedName), .Some(unwrappedPassword)):
    print("Hello \(unwrappedName)")
case let (.Some(unwrappedName), .None):
    print("Please enter a password")
default:
    print("Who are you?")
}

// This could be rewritten as
switch (optionalName, optionalPassword) {
case let (optionalName?, optionalPassword?):
    print("Hello \(optionalName)")
case let (optionalName?, nil):
    print("Please enter a password")
default:
    print("Who are you?")
}



// 5. Have cases for non-nils only

let data: [AnyObject?] = ["Bill", nil, 42, "Ted"]

for case let .Some(datum) in data {
    print (datum)
}

// THis could also be rewritten as
for case let datum? in data {
    print (datum)
}



// 6. Range matching
let age = 36

switch age {
case 0 ..< 18:
    print("Less than 18")
case 18 ..< 70:
    print("Between 18 and 70")
default:
    print("Old")
}


// 7. Tuple matching

let longUser = (name: "TwoStraws", password: "fr0sti3s", age:36)
switch longUser {
case let (name, _, 0 ..< 18):
    print("\(name) less than 18")
default:
    print("Old")
}


// 8. Matching in enums

enum WeatherType {
    case Cloudy(coverage: Int)
    case Sunny
    case Windy
}

let today = WeatherType.Cloudy(coverage: 100)

switch today {
case .Cloudy(let cover):
    print("It's cloudy with \(cover)% coverage")
case .Sunny:
    print("It's sunny")
case .Windy:
    print("It's windy")
}

// Another case
switch today {
case .Cloudy(let cloudiness) where cloudiness == 0:
    print("YOu live in Death Valley")
case .Cloudy(let cloudiness) where (1...99).contains(cloudiness):
    print("It's cloudy with \(cloudiness)% coverage")
case .Cloudy(let cloudiness) where cloudiness == 100:
    print("It's completely cloudy")
case .Windy:
    print("It's windy")
default:
    print("It's sunny")
}


let forecast: [WeatherType] = [.Cloudy(coverage: 40), .Sunny, .Windy, .Cloudy(coverage: 100), .Sunny]

/* // Can't do this with associated values
for day in forecast where day == .Sunny {
    print(day)
}
 */

for case .Cloudy(40) in forecast {
    print("Cloudy with 40% coverage")
}



// 9. Pattern matching with types

let vw: AnyObject = UIButton()

switch vw {
case is UIButton:
    print("Found a button")
case is UISwitch:
    print("Found a switch")
default:
    print("Found something else")
}


let view = UIView()
for label in view.subviews where label is UILabel {
    // The type of label is still UIView even though it only matches UILabels
    print("Found a label with frame \(label.frame)")
}

// If you want typecasting here too we need to do
for case let label as UILabel in view.subviews {
    print("Found a label with frame \(label.frame) and text \(label.text)")
}


// 10.

let numbers = [1, 2, 3, 4, 5, 6, 7, 9, 10]
for number in numbers where number % 2 == 1 {
    print(number)
}

let evenMoreNames = ["Michael Jackson", "Michael Caine", "Taylo Swift"]
for name in evenMoreNames where !name.hasPrefix("Michael") {
    print(name)
}

let nullabelNames: [String?] = ["Michael Jackson", nil, "Michael Caine", nil, "Taylo Swift"]
for case let name? in nullabelNames {
    print(name)
}

















