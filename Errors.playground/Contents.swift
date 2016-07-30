//: Playground - noun: a place where people can play

import UIKit

/*
    ERRORS
    Can be thrown and rethrown.
    Keyword "throws" says the function throws an error
    Non-throwing functions are subclasses of throwing functions
 */

enum PasswordError: ErrorType {
    case Empty
    case Short(minChars: Int)
    case Obvious(message: String)
}

func encryptString(str: String, withPassword password: String) throws -> String {
    
    if password == "12345" {
        throw PasswordError.Obvious(message: "I have the same password on my luggage!")
    }
    
    
    // Complex encyrption
    let encrypted = password + str + password
    return String(encrypted.characters.reverse())
}

func functionA() {
    do {
        try functionB()
    } catch {
        print("Error")
    }
}

func functionB() throws {
    // The throw propagates to the caller
     try functionC()
}

func functionC() throws {
    throw PasswordError.Empty
}

func testCatch() {
 
    do {
        let encrypted = try encryptString("Secret!", withPassword: "T4yl0r")
        print(encrypted)
    } catch PasswordError.Empty {
        print("You need a password")
    } catch PasswordError.Short(let minChars) where minChars < 5  {
        print("Password too short")
    } catch PasswordError.Obvious(let message) {
        print(message)
    } catch {
        print("Error")
    }
    
}


func definitelyWontThrow() {
    print("Shiny!")
}

// Warning but no error cuz non-throwing functions are subclasses of throwing functions
try definitelyWontThrow()




enum Failure: ErrorType {
    case BadNetwork(message: String)
    case Broken
}

func fetchRemote() throws -> String {
    throw Failure.BadNetwork(message: "Firewall blocked port")
}

func fetchLocal() -> String {
    return "Taylor"
}

func fetchUserData(closure: () throws -> String) {
    do {
        let userData = try closure()
        print("User data received: \(userData)")
    } catch Failure.BadNetwork(let message) {
        print(message)
    } catch {
        print("Fetch error")
    }
}

fetchUserData(fetchLocal)
fetchUserData(fetchRemote)


// ----------------------------------------------------------------------------------------------------------------------------------------------------------


// Retrowing: we only need to try catch when needed

func fetchUserDataWithRethrow(closure: () throws -> String) rethrows {
    let userData = try closure()
    print("User data received: \(userData)")
}

// needed try catch for fetchRemote
do {
    try fetchUserDataWithRethrow(fetchRemote)
} catch Failure.BadNetwork(let message) {
    print(message)
} catch {
    print("Fetch error")
}

// try catch not needed for fetchLocal
fetchUserDataWithRethrow(fetchLocal)



// ----------------------------------------------------------------------------------------------------------------------------------------------------------





















