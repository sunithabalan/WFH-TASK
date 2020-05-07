import Foundation

struct Stack {
    private var myArray: [String] = []
    
    mutating func push(_ element: String) {
        myArray.append(element)
    }
    
    mutating func pop() -> String? {
        return myArray.popLast()
    }
    
    func peek() -> String {
        guard let topElement = myArray.last else {return "This stack is empty."}
        return topElement
    }
}

var stack = Stack()
stack.peek()
stack.push("Suji")
stack.push("Saran")
stack.push("Mani")
stack.push("Raji")
print(stack)
stack.peek()
stack.pop()
stack.pop()
stack.pop()
stack.push("Raji")
stack.peek()
stack.pop()
print(stack)
