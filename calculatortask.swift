/*Create a simple calculator and calculate the values based on the order of precedence
Input will be string (e.g., "23+4+5"
output: 32.0 
*/

/*Create a simple calculator and calculate the values based on the order of precedence
Input will be string (e.g., "23+4+5"
output: 32.0 
*/


import Foundation
let symbols: [String] = ["+","-","*","/","(",")","."]
var expression = "10.1+2".replacingOccurrences(of:  " ", with: "")
extension String {
    func replacingFirstOccurrence(of target: String, with replacement: String) -> String {
        guard let range = self.range(of: target) else { return self }
        return self.replacingCharacters(in: range, with: replacement)
    }
}
func splitingDecimals()  -> ([String],String) {
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
func expressionArrayMaker (numbers: [String], tempExpression: String) -> [String] {
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
func floatProblem (expressionArray: [String]) -> [String] {
    var expressionArray = expressionArray
    for eachDot in 0..<(expressionArray.lazy.filter{$0 == "."}.count){
       let indexOfPoint = expressionArray.index(of: ".") ?? 1
        var floatValue = "\(expressionArray[indexOfPoint - 1]) \(expressionArray[indexOfPoint]) \(expressionArray[indexOfPoint + 1])"
        floatValue = floatValue.replacingOccurrences(of:  " ", with: "")
        expressionArray[indexOfPoint - 1] = floatValue
        expressionArray.remove(at: indexOfPoint)
        expressionArray.remove(at: indexOfPoint)
    }
    return expressionArray
}
func infixToPostFix(expressionArray:[String]) -> [String]{
    var numlist = [String]()
    var operatorList = [String]()
    // var array = "1234567890"
    var precedence:[String: Int] = ["*": 3, "/": 3, "+": 2, "-": 2, "(": 1]
    for character in expressionArray{
        if symbols.contains(character) != true{
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
    return numlist      
} 
func evaluateExpression(postfixExpression:[String]) -> Double{
    var operandList: [Double] = []
 
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
func doCalculation(operators: String, secondOperand: Double, firstOperand: Double) -> Double {
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

let result = splitingDecimals()
let resultOfexpressionArrayMaker = expressionArrayMaker (numbers: result.0, tempExpression: result.1)
let resultOfDecimal = floatProblem(expressionArray: resultOfexpressionArrayMaker)
let infixToPostFixConversion = infixToPostFix(expressionArray:resultOfDecimal) 
let evaluateExpressionResult = evaluateExpression(postfixExpression:infixToPostFixConversion)
print("The result for calculator is",evaluateExpressionResult)
