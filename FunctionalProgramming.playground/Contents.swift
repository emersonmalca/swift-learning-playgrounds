//: Playground - noun: a place where people can play

import UIKit

/*
 FUNCTIONAL PROGRAMMING
 1. Functions are fist-class data types
 2. They can be used as paremeters to other functions
 3. Same input, same output; NO side effects
 4. We should prefer immutable data types rather than using functions to change mutable variables
 5. Reduce how much state we track in our program - and often eliminate it altogether
*/


// 1. map()
// Takes a container, go through each value, apply transformation on each, returns a container
func lengthOfStrings (strings: [String]) -> [Int] {
    var result = [Int]()
    
    for string in strings {
        result.append(string.characters.count)
    }
    
    return result
}

func lengthOfStringsUsingMap (strings: [String]) -> [Int] {
    return strings.map { $0.characters.count }
}

let result = lengthOfStrings(["Taylor", "Justin", "Adele"])
let resultMap = lengthOfStringsUsingMap(["Taylor", "Justin", "Adele"])


// 1b. map()
let fruits = ["Apple", "Orange", "Pineapple"]
let fruitsResult = fruits.map { $0.uppercaseString }
fruitsResult

let scores = [100, 85, 80]
let passOrFail = scores.map { $0 > 85 ? "Pass" : "Fail" }
passOrFail

let position = [50, 40, 60]
let averageResults = position.map { 45...55 ~= $0 ? "Within avg" : "Outside avg" } // Is this value $0 inside that range
averageResults

let numbers: [Double] = [4, 9, 25, 36, 49]
let moreResults = numbers.map(sqrt) // It takes closures and functions as long as they have the same signature

// 1c. map() with other containers. Optionals are containers
let i: Int? = 10
let j = i.map { $0 * 2 }
j

func fetchUsername(id: Int) -> String? {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

var username: String? = fetchUsername(1989) // Could return nil
let formattedUsername = username.map { "Welcome \($0)" ?? "Unknown user" } //Using the nil-coalescent operator
let unsafeFormattedUsername = username != nil ? "Welcome \(username!)" : "Unkwown user" // Not recommended
formattedUsername


// ------------------------------------------------------------------------------------------------------------------------------------------------

// 2. flatMap()
// If you can flatMap over it, it's a Monad
// More complex than map() but very powerful
// Calls removes 1 level of containment first and then calls map() on each value
let array = [[1, 2], [3, 4], [5, 6]]
let flattened = Array(array.flatten()) // Reduce the container level by 1 (ex: 2-dimensional array into a 1-dimensional array)

let albums: [String?] = ["Fearless", nil, "1989", "Red", nil]
let albumResults = albums.map { $0 }
albumResults

// Removing 1 level of containment on optionals will remove the nils cuz optionals are containers
let flattenedAlbumResults = albums.flatMap { $0 }
flattenedAlbumResults

let myScores = ["100", "90", "Fish",  "75", "95"]
let flatMapScores = myScores.flatMap { Int($0) } //Int() returns an optional Int cuz the string might not be transformable to a Int
flatMapScores

let files = (1...10).flatMap { try? String(contentsOfFile: "someFile-\($0).txt") } // if contentsOfFile fails to open the file it will throw, try? will return nil so flatMap will ignore the nil
files


// ------------------------------------------------------------------------------------------------------------------------------------------------


// 3. filter()
// Iterate through items and returns the ones that return true
let fibonacciNumbers = [1, 1, 2, 5, 8, 13, 21, 34, 55]
let eventFibonacci = fibonacciNumbers.filter { $0 % 2 == 0 }
eventFibonacci

let words = ["1989", "Fearless", "Red"]
let inputString = "My fav album is Fearless"
let filteredResults = words.filter { inputString.containsString($0) }
filteredResults

let moreScores = ["Paul": 100, "Taylor": 95]
let goodScores = moreScores.filter { $1 > 95 } // This will return an array of tuples
goodScores


// ------------------------------------------------------------------------------------------------------------------------------------------------


// 4. reduce()
// Condenses a container into a single value
let otherScores = [100, 90, 95]
let otherScoresResult = otherScores.reduce("") { $0 + String($1) }
otherScoresResult

let moreNames = ["Taylor", "Paul", "Adele"]
let countNames = moreNames.reduce(0) { $0 + $1.characters.count }
countNames

// In this case it will go through all items. Because this could fail at any times through the iteration, in this specific case have a for loop that breaks would be better
let areAllNamesLongEnough = moreNames.reduce(true) { $0 && $1.characters.count > 4 } // Are all names greater than 4 in length
areAllNamesLongEnough
let longest = moreNames.reduce("") { $1.characters.count > $0.characters.count ? $1 : $0 }
longest

let evenMoreNumbers = [
    [1, 1, 2],
    [3, 5, 8],
    [13, 21, 34]
]
let moreFlattened: [Int] = evenMoreNumbers.reduce([]) { $0 + $1 } // Same as flatten()
moreFlattened



// ------------------------------------------------------------------------------------------------------------------------------------------------


// 5. sort()
// For custom structs we need to implemented our own sorting.
// We can also conform to the Comparable protocol in order to be able to use buil-in sort functions. This means we NEED TO modify the "<" and "==" operators globally

struct Person: Comparable {
    var name: String
    var age: Int
}

func <(lhs: Person, rhs: Person) -> Bool {
    return lhs.name < rhs.name
}

func ==(lhs: Person, rhs: Person) -> Bool {
    return lhs.name == rhs.name
}

let taylor = Person(name: "Taylor", age: 26)
let paul = Person(name: "Paul", age: 36)
let justin = Person(name: "Justin", age: 22)
let adele = Person(name: "Adele", age: 27)

let people = [taylor, paul, justin, adele]
let sortedPeople = people.sort()
sortedPeople

let reversedSortedPeople = people.sort().reverse() // This will NOT return an array cuz reverse() is massively optimized
let reversedSorterPeopleArray = Array(reversedSortedPeople) // This will give you an array



// ------------------------------------------------------------------------------------------------------------------------------------------------


// 6. Chaining functions
let london = (name: "Londom", continent: "Europe", population: 8_000_000)
let paris = (name: "Paris", continent: "Europe", population: 2_000_000)
let newyork = (name: "New York", continent: "North America", population: 10_000_000)
let rome = (name: "Rome", continent: "Europe", population: 2_000_000)
let tokyo = (name: "Tokyo", continent: "Asia", population: 18_000_000)

let cities = [london, paris, newyork, rome, tokyo]

let totalPopulation = cities.reduce(0) { $0 + $1.population }
totalPopulation

let europePopulation = cities.filter { $0.continent == "Europe" }.reduce(0) { $0 + $1.population }
europePopulation

let biggiesCities = cities.filter { $0.population > 5_000_000 }.sort { $0.population > $1.population }
biggiesCities


// 6b. More chaining functions (merging)
// infix means that it's between 2 parameters
// left means it compares the left one first to the right one
infix operator >>> { associativity left }

// lsh: function that takes a T and returns a U
// rhs: function that takes a U and returns a V
// returns a function that takes T and returns V
func  >>><T, U, V>(lhs: T -> U, rhs: U -> V) -> T -> V {
    return { rhs(lhs($0)) }
}

func generateRandomNumber(max: Int) -> Int {
    let number = Int(arc4random_uniform(UInt32(max)))
    return number
}

func calculateFactors(number: Int) -> [Int] {
    return (1...number).filter { number % $0 == 0 }
}

func reduceToString(number: [Int]) -> String {
    return numbers.reduce("Factors: ") { $0 + String($1) + " " }
}

let lameResult =  reduceToString(calculateFactors(generateRandomNumber(100)))

let combinedFunctions = generateRandomNumber >>> calculateFactors >>> reduceToString
combinedFunctions(100)






