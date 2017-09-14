//: Playground - noun: a place where people can play

import UIKit

//Implementation of LinkedList
class Node<T: Equatable> {
    var value: T? = nil
    var next: Node? = nil
}

class LinkedList<T: Equatable> {
    var head = Node<T>()
    
    func insert(value: T) {
        //find to see if empty list
        if self.head.value == nil {
            self.head.value = value
        } else {
            //find the last node without a next value
            var lastNode = self.head
            while lastNode.next != nil {
                lastNode = lastNode.next!
            }
            //once found, create a new node and connect the linked list
            let newNode = Node<T>()
            newNode.value = value
            lastNode.next = newNode
        }
    }
    
    func remove(value: T) {
        //Check if the value is at the head
        if self.head.value == value {
            self.head = self.head.next!
        }
        //Traverse the linked list to see if node is in the linked list
        if self.head.value != nil {
            var node = self.head
            var previousNode = Node<T>()
            //If value found, exit the loop
            while node.value != value && node.next != nil {
                previousNode = node
                node = node.next!
            }
            //once found, connect the previous node to the current node's next
            if node.value == value {
                if node.next != nil {
                    previousNode.next = node.next
                } else {
                    //if at the end, the next is nil
                    previousNode.next = nil
                }
            }
        }
    }
}

func printList(_ head: Node<Int>?){
    if head != nil{
        print(head!.value ?? 0)
        printList(head?.next)
    }
}

var list = LinkedList<Int>()

list.insert(value: 7)
list.insert(value: 1)
list.insert(value: 3)
list.insert(value: 6)
list.insert(value: 6)


func findNthElementToEnd(head:Node<Int>?, nthVal: Int) -> Int? {
    var curr = head
    var nth:Node<Int>? = nil
    var count = 0
    var location = nthVal - 1
    
    while curr != nil {
        if count % location == 0 {
            if nth == nil {
                nth = head
            } else {
                nth = nth?.next
            }
        }
        
        curr = curr?.next
        count += 1
    }
    
    return nth?.value
}


var newList = findNthElementToEnd(head: list.head, nthVal: 3)
print(newList ?? 0)
