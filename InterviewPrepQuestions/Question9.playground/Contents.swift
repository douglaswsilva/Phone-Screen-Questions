//: Playground - noun: a place where people can play

import UIKit

// Question 9: How do you find duplicates in an array if there is more than one duplicate?
func findDuplicates(array: [Int]) -> Bool {
    
    var dict = [Int: Int]()
    
    for i in 0 ..< array.count {
        let key = array[i]
        if dict[key] != nil {
            var count = dict[key]!
            dict[key] = count + 1
        } else {
            dict[key] = 1
        }
    }
    
    var countDuplicates = 0
    
    print("Duplicates")

    for key in dict.keys {
        if dict[key]! > 1 {
            countDuplicates += 1
            print("Key: \(key), Value: \(dict[key]!)")
        }
    }
    
    if countDuplicates > 0 {
        return true
    }
    
    return false
}

print(findDuplicates(array: [4,2,2,4,4]))