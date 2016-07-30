//: Playground - noun: a place where people can play

import UIKit

/*
    GENERICS
    Can be constrained, thus secure, yet flexible.
*/

// 1. Reducing code with generics
func inspectString(str: String) {
    print("Received String with the value \(str)")
}

inspectString("Haters gonna hate")


func inspectInt(num: Int) {
    print("Received Int with the value \(num)")
}

inspectInt(42)

// We can write all those functions with generics in a single function
func inspect<T>(value: T) {
    print("Received \(value.dynamicType) with the value \(value)")
}

inspect("Haters gonna hate")
inspect(42)



// 2. Constraining generics

// This function will only take values that conform to IntegerType
func squareSomething<T: IntegerType> (value: T) -> T {
    return value * value
}

// We can define our own protocols
protocol Numeric {
    // "Self" means whatever class this is
    func *(lhs: Self, rhs: Self) -> Self
}

// Protocol extensions. In this case Float, Double and Int already implement the "*" operator, so we don't need to implement it inside the {}s
extension Float: Numeric {}
extension Double: Numeric {}
extension Int: Numeric {}

// So now we can constrain our generics in this function to conform to our custom protocol Numeric
func squareSomethingNumeric<T: Numeric> (value: T) -> T {
    return value * value
}


// 3. Generic structs
// Deque is a double-ended queue
// The mutating keyword is required in structs when modifying an instance variable
struct Deque<T> {
    var array = [T]()
    
    mutating func pushBack(obj: T) {
        array.append(obj)
    }
    
    mutating func pushFront(obj: T) {
        array.insert(obj, atIndex: 0)
    }
    
    mutating func popBack() -> T? {
        return array.popLast()
    }
    
    mutating func popFront() -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
}

var testDeque = Deque<Int>()
testDeque.pushBack(5)
testDeque.pushFront(2)
testDeque.pushFront(19)
testDeque.popBack()




// 4. Foundation
// In this case we don't need the mutating keyword cuz NSCountedSet is of refence type, not value type, so mutating the ivar internalSet is cool
struct CountedSet<T: AnyObject> {
    var internalSet = NSCountedSet()
    
    func addObject(obj: T) {
        internalSet.addObject(obj)
    }
    
    func removeObject(obj: T) {
        internalSet.removeObject(obj)
    }
    
    func countForObject(obj: T) -> Int {
        return internalSet.countForObject(obj)
    }
}

var countedSet = CountedSet<NSString>()
countedSet.addObject("Hello")
countedSet.addObject("Hello")
countedSet.addObject("Hello")
countedSet.addObject("Hello")
countedSet.addObject("Hello")
//countedSet.addObject(5) // Can't use a different type than the defined when creating the CountedSet







