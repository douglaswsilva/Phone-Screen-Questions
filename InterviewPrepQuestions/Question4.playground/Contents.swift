//: Playground - noun: a place where people can play

import UIKit

// Question 4: In an integer array, there is 1 to 100 number, out of one is duplicate, how to find?

func findDuplicate(array: [Int]) -> Int {

    let array100 = Array(1 ... 100)
    let sum100 = array100.reduce(0, +)
    
    let sum = array.reduce(0, +)
    
    return 100 - (sum100 - sum)
}

var array = Array(1 ... 99)
array.append(5)
print(findDuplicate(array: array))