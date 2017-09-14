//: Playground - noun: a place where people can play

import UIKit

// Question 13 : Implement a binary search tree

class Node<T> {
    let value: T
    let leftChild: Node<T>?
    let rightChild: Node<T>?
    
    init(value: T, leftChild: Node<T>, rightChild: Node<T>) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

func search(node: Node<Int>?, searchValue: Int) -> Bool {
    if node == nil {
        return false
    }
    
    if searchValue == node!.value {
        return true
    } else if searchValue > node!.value {
        return search(node: node?.rightChild, searchValue: searchValue)
    } else {
        return search(node: node?.leftChild, searchValue: searchValue)
    }
}


//Tree
//      10
//     /  \
//    5   14
//   /   /  \
//  1   11  20
// Build Tree
let oneNode = Node(value: 1, leftChild: nil, rightChild: nil)
let fiveNode = Node(value: 5, leftChild: oneNode, rightChild: nil)
let elevenNode = Node(value: 11, leftChild: nil, rightChild: nil)
let twentyNode = Node(value: 20, leftChild: nil, rightChild: nil)
let fourteenNode = Node(value: 14, leftChild: elevenNode, rightChild: twentyNode)
let tenNode = Node(value: 10, leftChild: fiveNode, rightChild: fourteenNode)

print(search(node: tenNode, searchValue: 5))