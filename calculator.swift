import Foundation
func cal()
{
    var input = "(1 + 2) * 4 + 5  "
    var removingSpace = input.replacingOccurrences(of: " ", with: "")
    print(removingSpace)
    var inputList = removingSpace.map { String($0) }
    print(inputList)
    var numlist = [Int]()
    var operatorList = [Any]()
    var tempnum = " "
    var array = ["1","2","3","4","5","6","7","8","9","0","."]
    formnumber(numlist: numlist, operatorList: operatorList)
    solve(numlist: numlist, operatorList: operatorList)

}
func formnumber(numlist: [Int], operatorList: [Any])
{
}
func solve(numlist: [Int], operatorList: [Any])
{
}
func solveBracket() 
{
    //calculator()
    var removingSpace = input.replacingOccurrences(of: " ", with: "")
    var inputList = removingSpace.map { String($0) }
    print(inputList)
    var countInput = inputList.count
    var numlist = [Int]()
    var operatorList = [String]()
    var array = ["1","2","3","4","5","6","7","8","9","0","."]
    var tempNum = " "
    for (x,y) in inputList.enumerated(){
        if array.contains(String(x)){
            tempNum = tempNum + String(x)
            //print(tempNum)
        }
        else{
            if tempNum != " "{
               numlist.append(Int(tempNum)!)
               //print(numlist)
            }
            tempNum == " "
            operatorList.append(String(x))
            print(operatorList)
             }
        } 
         while (operatorList.contains("+")) || (operatorList.contains("-")) || (operatorList.contains("*")) || (operatorList.contains("/")) {
			solve(numlist: numlist,operatorList: operatorList)
    }

             
}
solveBracket()
func solve(numlist: [Int], operatorList: [String])
{
}
func formnumber(numlist: [Int], operatorList: [String])
{
}

    


