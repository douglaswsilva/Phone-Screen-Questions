//: Playground - noun: a place where people can play

import UIKit

struct Stack {
    var items = [Character]()
    
    mutating func push(_ item: Character) {
        items.append(item)
    }
    
    mutating func pop() -> Character {
        return items.removeLast()
    }
    
    mutating func count() -> Int {
        return items.count
    }
}

func checkIfValid(string:String) -> Bool {
    
    var myStack = Stack()
    
    for c in string.characters{
        if c == "(" || c == "[" || c == "{"{
            myStack.push(c)
        }
        else if c == ")"{
            if myStack.count() == 0 { return false }
            let compare = myStack.pop()
            if compare != "("{
                return false
            }
        }
        else if c == "]"{
            if myStack.count() == 0 { return false }

            let compare = myStack.pop()
            if compare != "["{
                return false
            }
        }
        else if c == "}"{
            if myStack.count() == 0 { return false }

            let compare = myStack.pop()
            if compare != "{"{
                return false
            }
        }
    }
    
    if myStack.count() != 0 {
        return false
    }
    
    return true
}

let string = "{[{}]}"

print(checkIfValid(string: string))
