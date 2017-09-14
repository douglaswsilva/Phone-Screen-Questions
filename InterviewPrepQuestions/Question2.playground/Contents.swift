//: Playground - noun: a place where people can play

import UIKit

class Node {
    let value: Int
    var next: Node?
    
    init(value:Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

var oneNode = Node(value: 1, next: nil)
let fiveNode = Node(value: 2, next: oneNode)
let fourNode = Node(value: 4, next: fiveNode)
let threeNode = Node(value: 2, next: fourNode)
let twoNode = Node(value: 2, next: threeNode)
oneNode.next = twoNode

func printList(head: Node?){
    if head != nil{
        print(head!.value)
        printList(head:head!.next)
    }
}

//printList(head: oneNode)

func hasLoop(head: Node?) -> Bool {
    
    var current = head?.next
    var start = head
    
    if head == nil {
        return false
    }
    
    while current != nil {
        if current === start {
            return true
        }
        current = current?.next
    }
    
    return false
}

print(hasLoop(head: oneNode))