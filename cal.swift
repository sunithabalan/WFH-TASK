func infixToPostfix(expression: String) -> String {
    var precedence: [Character: Int] = ["*": 3, "/": 3, "+": 2, "-": 2, "(": 1]
    let numbers = "1234567890"
    var operatorList: [Character] = []
    var postfixList: [Character] = []
    let expressionList = Array(expression)
    for character in expressionList{
        if numbers.contains(character){
            postfixList.append(character)
        }
        else if character == "(" {
            operatorList.append(character)
        }
        else if character == ")" {
            var removedElement = operatorList.removeLast()
            while "\(removedElement)" != "(" {
                postfixList.append(removedElement)
                removedElement = operatorList.removeLast()
            }
        }
        else {
        while operatorList.count != 0 && precedence[character]! <= precedence[operatorList.last!]! {
             postfixList.append(operatorList.removeLast())
        }
        operatorList.append(character)
        }
    }
     while operatorList.count != 0 {
        postfixList.append(operatorList.removeLast())
    }
    return String(postfixList)
}
func postfixEvaluation(postfixExpression: String) -> Double {
    var operandList: [Double] = []
    let expressionList = Array(postfixExpression)
    let numbers = "1234567890"
    for each in expressionList {
        if numbers.contains(each) {
            operandList.append(Double(String(each))!)
        }
        else {
            let secondOperand = operandList.removeLast()
            let firstOperand = operandList.removeLast()
            let result = doCalculation(operators: each, firstOperand: firstOperand, secondOperand: secondOperand)
            operandList.append(result)
        }
    }
    return operandList.removeLast()
}
func doCalculation(operators: Character, firstOperand: Double, secondOperand: Double) -> Double {
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
let expressions = "(3*2)+(2*5)-2"

let result:String = infixToPostfix(expression: expressions)
let finalResult: Double = postfixEvaluation(postfixExpression: result)
print(expressions + " = " + "\(finalResult)")
