//: Playground - noun: a place where people can play

import UIKit

/*
    TUPLES
    Tuples of 1 element are of type of the element
 */


// singer is now a Tuple of type (String, String) with exact labels "first" and "last"
var singer = (first: "Taylor", last: "Swift")
singer.first

var singerWithClosure = (first: "Taylor", last: "Swift", sing: { (lyrics: String) in
    print(lyrics)
})

singerWithClosure.sing("a song")


// Optional tuples
let optionalElements: (String?, String?) = ("Taylor", nil)
let optionalTuple: (String, String)? = ("Taylor", "Swift")


// Compare tuples (it doesn't compare label names, just the values)
let singerOne = (first: "Taylor", last: "Swift")
let alien = (first: "Justin", last: "Beiber")

if singer == alien {
    print("Match!")
} else {
    print("No match!")
}


// ----------
// Typealias

let father = (first: "Scott", last: "Swift")
let mother = (first: "Andrea", last: "Finlay")

func marryTaylorsParents(man man: (first: String, last: String), woman: (first: String, last: String)) -> (husband: (first: String, last: String), wife: (first: String, last: String)) {
    return (man, (woman.first, man.last))
}

typealias Name = (first: String, last: String)
func marryTaylorsParentsWithTypeAlias(man man: Name, woman: Name) -> (husband: Name, wife: Name) {
    return (man, (woman.first, man.last))
}