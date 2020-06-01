/*Create a simple calculator and calculate the values based on the order of precedence
Input will be string (e.g., "23+4+5"
output: 32.0 
*/


import Foundation
var expression = "23+4+5"

extension String {
    func replacingFirstOccurrence(of target: String, with replacement: String) -> String {
        guard let range = self.range(of: target) else { return self }
        return self.replacingCharacters(in: range, with: replacement)
    }
}
class Calculator{
   class func splitingDecimals()  -> ([String],String) {
   var tempExpression = expression
   var numbers = [String]()
   let decimalNumbers = expression.components(separatedBy: CharacterSet.decimalDigits.inverted)
   var indexOfDecimalNumbers = 0
    for each in decimalNumbers {
        if let number = Int(each) {
            numbers.append(String(number))
            tempExpression = tempExpression.replacingFirstOccurrence(of: decimalNumbers[indexOfDecimalNumbers], with: "1")
            indexOfDecimalNumbers += 1
        }
    }
    return (numbers,tempExpression) 
}
class func expressionArrayMaker (numbers: [String], tempExpression: String) -> [String] {
    var numbers = numbers
    let tempExpressionArray = Array(tempExpression)
    var expressionArray = [String]()
    for each in tempExpressionArray {
        if each == "1" {
            expressionArray.append("\(numbers[0])")
            numbers.remove(at:0)
        } else {
            expressionArray.append("\(each)")
        } 
    }
    return expressionArray
}
class func infixToPostFix(expressionArray:[String]) -> [String]{
    var numlist = [String]()
    var operatorList = [String]()
    var array = "1234567890"
    var precedence:[String: Int] = ["*": 3, "/": 3, "+": 2, "-": 2, "(": 1]
    for character in expressionArray{
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
    let string = numlist.map { String($0) }.joined(separator: "")
    //print(string)
    return numlist      
} 
class func evaluateExpression(postfixExpression:[String]) -> Double{
    var operandList: [Double] = []
    let symbols: [String] = ["+","-","*","/","(",")","."]
    let symbolsBasedValues = ["+": 0.0, "-": 0.0, "*": 1.0, "/": 1.0]
    var result = 0.0
    for each in postfixExpression {
        if symbols.contains(each) != true {
            operandList.append(Double(String(each)) ?? 0)
        }
        else {
            if operandList.count == 1 {
                result = doCalculation(operators: each, secondOperand: operandList.removeLast(), firstOperand: symbolsBasedValues[each]!)
            }
            else {
                result = doCalculation(operators: each, secondOperand: operandList.removeLast(), firstOperand: operandList.removeLast())
            }
            operandList.append(result)
        }
    }
    return operandList.removeLast()
}

//perform calculations based on  operators
class func doCalculation(operators: String, secondOperand: Double, firstOperand: Double) -> Double {
    switch operators {
        case "+" :
            return firstOperand + secondOperand
        case "-" :
            return firstOperand - secondOperand
        case "*" :
            return firstOperand * secondOperand
        case "/" :
            return firstOperand / secondOperand  
        default : 
            return 0                
    }
}
}

let result = Calculator.splitingDecimals()
let resultOfexpressionArrayMaker = Calculator.expressionArrayMaker (numbers: result.0, tempExpression: result.1)
let infixToPostFixConversion = Calculator.infixToPostFix(expressionArray:resultOfexpressionArrayMaker) 
let evaluateExpressionResult = Calculator.evaluateExpression(postfixExpression:infixToPostFixConversion)
print("The result for calculator is",evaluateExpressionResult)
