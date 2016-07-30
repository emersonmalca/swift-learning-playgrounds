//: Playground - noun: a place where people can play

import UIKit

/*
    LABELED STATEMENTS
    Exiting scope
    "goto" done right, simpler
 */

// two dimensional array of empty strings
var board = [[String]](count:10, repeatedValue: [String](count:10, repeatedValue: ""))

// Place the "x" somewhere
board[3][5] = "x"

// Find the x
rowLoop: for (rowIndex, cols) in board.enumerate() {
    for (colIndex, col) in cols.enumerate() {
        if col == "x" {
            print("Found treasure at row \(rowIndex), col \(colIndex)")
            break rowLoop // Break rowLoop
        }
    }
}


/// ------------------------------------------------------------------


func userRequestedPrint() -> Bool { return true }
func documentSaved() -> Bool { return true }
func userAuthenticated() -> Bool { return true }
func connectToNetwork() -> Bool { return true }
func uploadDocument() -> Bool { return true }
func printDocument() -> Bool { return true }

// Option A
if userRequestedPrint() {
    if documentSaved() {
        if userAuthenticated() {
            if connectToNetwork() {
                if uploadDocument() {
                    if printDocument() {
                        print("Printed successfully")
                    }
                }
            }
        }
    }
}

// Option B
printing: if userRequestedPrint() {
    guard documentSaved() else { break printing }
    guard userAuthenticated() else { break printing }
    guard connectToNetwork() else { break printing }
    guard uploadDocument() else { break printing }
    guard printDocument() else { break printing }
    
    print("Printed successfully")
}