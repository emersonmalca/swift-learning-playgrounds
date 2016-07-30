//: Playground - noun: a place where people can play

import UIKit

/*
    NIL COALESCING
    // Making sure we get a value from an optional
 */

// This will print an optional name
let name: String? = "Taylor"
print(name)

// Nil Coalescing will give us a value for sure so it will print the name
let unwrappedName = name ?? "Anon"
print(unwrappedName)

func returnsOptionalName() -> String? {
    return nil
}
// Will returin Anonymous if the functoin returns nil
print(returnsOptionalName() ?? "Anonymous")



// 2. Try ? 😍
// If try? fails is returns a nil so if we pass that to a nil coalescing operator ?? it will use the other side

/*
 // Without ??
let savedText: String
do {
    savedText = try String(contentsOfFile: "saved.txt")
} catch {
    print("Failed to load")
}
 */

let savedText = (try? String(contentsOfFile: "saved.txt")) ?? "Hello, world"
print(savedText)