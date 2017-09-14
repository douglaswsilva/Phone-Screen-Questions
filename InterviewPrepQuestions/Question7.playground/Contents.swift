//: Playground - noun: a place where people can play

import UIKit

//Question 7: Write a program to sort an array using Bubble Sort algorithm?

func bubbleSort(_ array: [Int]) -> [Int] {
    
    var array = array
    
    for i in 0 ..< array.count {
        for j in i ..< array.count {
            if array[i] > array[j] {
                let temp = array[i]
                array[i] = array[j]
                array[j] = temp
            }
        }
    }
    
    return array
}


let array = [5,4,3,2,7,1]
print(bubbleSort(array))