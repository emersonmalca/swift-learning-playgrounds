//: Playground - noun: a place where people can play

import UIKit

/*
    Closure:
    A block of code that can be passed around and stored like a variable, which also has the ability to capture any values it uses.
    Allows special short-hand syntax (ex: $0)
    Closures are reference type.
 */

// 1. Define closure with parameter
let greetPerson = { (name: String) in
    print("Hello \(name), how are you?")
}
// Call closure
greetPerson("Emerson")

// 2. You can copy closures like any other type
let greetCopy = greetPerson
greetCopy("EmersonCopy")

// 3. Functions can accept closures as parameters
// In this case the parameter takes a String and returns nothing and it's called closure
// Optionally the signature of the closure could omit paremeter names (ex: closure: (String) -> Void
func runSomeClosure(closure: (name: String) -> Void) {
    closure(name: "EmersonRSC")
}

runSomeClosure(greetPerson)


// 4. Closures will capture the variables inside of it by refence
var counter = 0
let greetPersonB = { (name: String) in
    counter += 1
    print("Hello \(name) \(counter)")
}

greetPersonB("Emerson")
greetPersonB("Emerson")
greetPersonB("Emerson")

// 5. So if we copy a closure that captured a variable they will both point to the same variable
let greetPersonBCopy = greetPersonB
greetPersonBCopy("Emerson")


// 6. Swift can infer many things 
// Type inference of the parameter being passed in cuz the 'names' array is an array of Strings
// One line closure doesn't need the keyword return
// If last parameter of a method is a closure we don't need the parenthesis
// We can reaplce the paremeter names with anonymous parameters using their index (ex: $0)
let names = ["Michael Jackson", "Taylor Swift", "Michael Caine", "Adele Adkins", "Michael Jordan"]
/*
let result = names.filter { (name: String) -> Bool in
    return name.hasPrefix("Michael")
}
 */
let result = names.filter { $0.hasPrefix("Michael") }
print(result)


// 7. We can pass an entire function as a closure to be executed for every element of the array
// So in this case we are passing an item from words (which is a String) into the function 'containsString'
let words = ["1989", "Fearless"]
let input = "My fav album is Fearless"
words.contains(input.containsString)




// 8. "+" is a function that takes 2 paremeters and returns the sum so it can be passed to the reduce function as a closure
let numbers = [1, 3, 5, 7, 9]
// Again, if the last paremeter is a closure we can omit the parameter name and start the {} right after the first paremeter of 'reduce'
/*
numbers.reduce(0) { (int1, int2) -> Int in
    return int1 + int2
}
 */
// Summarized version
let resultReduce = numbers.reduce(0, combine: +)




// 9. @noescape tells Swift that the closure will NOT be retained pass the lifetime of the function it is called in
// This will give a performance boost and the compiler will give you an error is you're not supposed to use it there
var queuedClosures: [() -> Void] = []

// Compiler error to use @noescape here
/*
 func queueClosure(@noescape closure: () -> Void) {
    queuedClosures.append(closure)
 }
 */

func queueClosure(closure: () -> Void) {
    queuedClosures.append(closure)
}

queueClosure({ print("Running closure 1") })
queueClosure({ print("Running closure 2") })
queueClosure({ print("Running closure 3") })

func executeQueuedClosures() {
    for closure in queuedClosures {
        closure()
    }
}

executeQueuedClosures()



// 10. @autoclosure closures will NOT be executed immediately until actually needed

func doStuff() {
    print("Hello")
}

func printTest(@autoclosure result: () -> Void) {
    print("Before")
    result()
    print("After")
}
//printTest(doStuff)

// Assert uses @autoclosure for its first paremeter
assert(1 == 1, "Maths failure")


// Exercise:
// 1. Write a closure called rateSpeaker that can be called like rateSpeaker("Paul", 10)

let rateSpeaker = { (name: String, score: Int) in
    print ("\(name) gets a score of \(score)")
}
rateSpeaker("Paul", 10)

// 2. Write two functions that generate a random number of different sizes.
//    Write a struct that stores one of those functions as a property, then write a method for that struct that calls the closure and prints its return value.

func randomNum () -> UInt32 {
    return arc4random()
}

func randomNumTwo () -> UInt32 {
    return arc4random()
}

struct RandomStruct {
    let generator: () -> UInt32
    
    func generateRandomNumber() {
        print(generator())
    }
}

let random = RandomStruct(generator: randomNum)
random.generateRandomNumber()







