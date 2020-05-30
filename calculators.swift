import Foundation
var numlist = [Character]()
var operatorList = [Character]()
var input = " (1 + 2) * 4 + 5  "
var tempNum = " "
func solveBracket() -> String
{
    var removingSpace = input.replacingOccurrences(of: " ", with: "")
    print(removingSpace)
    var inputList = removingSpace.flatMap{(String($0))}
    print(inputList)
    var countInput = inputList.count
    var array = "1234567890"
    var precedence:[Character: Int] = ["*": 3, "/": 3, "+": 2, "-": 2, "(": 1]
    for character in inputList{
        if array.contains(character){
            numlist.append(character)
        }
        else if character == "(" {
            operatorList.append(character)
        }
        else if character  == ")" {
            var removedElement = operatorList.removeLast()
            while "\(removedElement)" != "(" {
                numlist.append(removedElement)
                removedElement = operatorList.removeLast()
            }    
        }
         else {
        while operatorList.count != 0 && precedence[character]! <= precedence[operatorList.last!]! {
             numlist.append(operatorList.removeLast())
        }
        operatorList.append(character)
        }
      
    }  
   while operatorList.count != 0 {
        numlist.append(operatorList.removeLast())
    }
    return String(numlist)          
} 
func evaluateExpression(result:String) -> Int{
    var operandlist:[Int] = []
    for each in result{
        if "1234567890".contains(each){
             operandlist.append(Int(String(each))!)
        }
        else{
            let secondValue = operandlist.removeLast()
            let firstValue = operandlist.removeLast()
            let result = calculation(operators:each,secondValue:secondValue,firstValue:firstValue)
            operandlist.append(result)
        }
    }
    return operandlist.removeLast()
}
func calculation(operators:Character,secondValue:Int,firstValue:Int) -> Int{
    switch operators {
        case "+" :
            return firstValue + secondValue
        case "-" :
            return firstValue - secondValue
        case "*" :
            return firstValue * secondValue
        case "/" :
            return firstValue / secondValue
        default : 
            return 0                
    }
}
  
let result = solveBracket()
let calculatedResult = evaluateExpression(result:result)
print("The result is",calculatedResult)
