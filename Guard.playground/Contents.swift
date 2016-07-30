//: Playground - noun: a place where people can play

import UIKit

/*
    GUARD
    Early returns
    Reduces indent level
    Highly visible happy path
    Unwraps stay in scope
    Exits any scope
 */



func giveAwardTo(name: String) {
    // Swift will not let you not return in guard. It will give you a compiler error
    guard name == "Taylor Swift" else {
        print("No way!")
        return
    }
    
    print("Congratulations \(name)")
}

giveAwardTo("Taylor Swift")
giveAwardTo("Drake")



// Unwrapping winner continues to work after guard
func giveAwardToWithOptional(name: String?) {
    guard let winner = name else {
        print("No one won")
        return
    }
    
    print("Congratulations \(winner)")
}


// Print all numbers divisible by 8
for i in 1...100 {
    guard i % 8 == 0 else { continue }
    print(i)
}