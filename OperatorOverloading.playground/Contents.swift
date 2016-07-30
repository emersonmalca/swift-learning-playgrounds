//: Playground - noun: a place where people can play

import UIKit

/*
    OPERATOR OVERLOADING
    Overload +, -, *, /
 */

/*
 // Messing around with the == operator
func ==(lhs: Int, rhs: Int) -> Bool {
    return false
}

if 4 == 4 {
    print("Match")
} else {
    print("No match")
}*/



// ------------------------------------------------------------------------------------------------------------------------

// We can change the precedence of "+" and "*" to make sum more important than multiplication
/*
infix operator + {
    associativity left
    precedence 140
}

infix operator * {
    associativity left
    precedence 129
}

let i = 5 * 10 + 1
*/


// ------------------------------------------------------------------------------------------------------------------------


// Extending existing operators: Multiply array of integers together

func *(lhs: [Int], rhs: [Int]) -> [Int] {
    guard lhs.count == rhs.count else { return lhs }
    
    var result = [Int]()
    
    for (index, int) in lhs.enumerate() {
        result.append(int * rhs[index])
    }
    return result
}

let results = [1, 2, 3] * [1, 2, 3]



// ------------------------------------------------------------------------------------------------------------------------


// New operator: Define our own operator that is the same as pow()

infix operator ** { }

func **(lhs: Double, rhs: Double) -> Double {
    return pow(lhs, rhs)
}

2 ** 4



// ------------------------------------------------------------------------------------------------------------------------

// Modifying existing operators (in a meaningful way): Modify the range operator to be able to do 1...10...1

func ...(lhs: Range<Int>, rhs: Int) -> [Int] {
    guard let maximum = lhs.last else { return Array(lhs) }
    
    let downwards = (rhs ..< maximum).reverse()
    return Array(lhs) + downwards
}

infix operator ... {
    associativity left
    precedence 135
}

let range = 1...10...1



// ------------------------------------------------------------------------------------------------------------------------

// More modifying existing operators for arrays of different types

let strings = ["A", "B"]
let nums = [1, 2]

func +(lhs: [String], rhs: [Int]) -> [String] {
    let rhsStrings = rhs.map { String($0) }
    return lhs + rhsStrings
}

let joined = strings + nums





