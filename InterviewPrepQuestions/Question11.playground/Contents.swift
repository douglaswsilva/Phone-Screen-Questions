//: Playground - noun: a place where people can play

import UIKit

//Question 11 : Write Java program to print Fibonacci series ?

func fibonacciRecursive(_ n: Int) -> Int{
    var n = n
    
    if n < 2 {
        return n
    } else {
        return fibonacciRecursive(n - 1) + fibonacciRecursive(n - 2)
    }
}

func fibonacci(_ n: Int) -> [Int]{
    var x = -1
    var y = 1
    var sum = 0
    var list = [Int]()
    
    for _ in 0 ..< n {
        sum = x + y
        x = y
        y = sum
        
        list.append(sum)
    }
    
    return list
}

print(fibonacci(16))
