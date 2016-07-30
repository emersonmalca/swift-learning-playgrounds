//: Playground - noun: a place where people can play

import UIKit

/*
    LAZY LOADING
    Pervasive optimisation
    Can use closures or methods
    Can be applied to sequences
    Works with singletons too
*/


// 1. Lazy load properties
// Lazy properties are cached

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    // Not cached, recomputed every time
    func reversedNameFunction() -> String {
        return "\(name.uppercaseString) backwards is \(String(name.uppercaseString.characters.reverse()))"
    }
    
    // No retain cycle for using "self" here because this is a non-escaping closure (because of the trailing parenthesis), doesn't retain self
    lazy var reverseName: String = {
        return "\(self.name.uppercaseString) backwards is \(String(self.name.uppercaseString.characters.reverse()))"
    }()
    
    // A lazy property can also call a function, which is great if the function is pretty big
    lazy var otherReversedName: String = self.getReversedName()
    
    private func getReversedName() -> String {
        return "\(name.uppercaseString) backwards is \(String(name.uppercaseString.characters.reverse()))"
    }
}

let singer = Person(name: "Taylor")
// reversedNameFunction is not cached so it's computed every time
singer.reversedNameFunction()
singer.reversedNameFunction()
singer.reversedNameFunction()

// reverseName is lazy loaded so computed only once
singer.reverseName



// -------------------------------------------------------------------------------------------------------------------------------------


// 2. Singleton

class MusicPlayer {
    
    init() {
        print("Ready to play songs!")
    }
}

class Singer {
    // All static let singletons are automatically lazy
    static let musicPlayer = MusicPlayer()
    
    init() {
        print("Created a new singer")
    }
}

let taylor = Singer()
Singer.musicPlayer



// -------------------------------------------------------------------------------------------------------------------------------------



// 3. Lazy sequences
// Lazy sequences DO NOT cache anything

func fibonacci(num: Int) -> Int {
    if num < 2 {
        return num
    } else {
        return fibonacci(num - 1) + fibonacci(num - 2)
    }
}

let fibSequence = (0...15).map(fibonacci) // This is super slow the larger the range is
print(fibSequence[10])

// But we can lazy load it to only be calculated when it's called
let lazyFibSequence = (0...199).lazy.map(fibonacci)
// Meaning this will only calculated up to 10 cuz that's what is needed
print(lazyFibSequence[10])

















