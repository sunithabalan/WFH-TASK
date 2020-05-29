// import Foundation

var input = " (1 + 2) * 4 + 5  "
func calculator()
{
    var removingSpace = input.replacingOccurrences(of: " ", with: "")
    print(removingSpace)
    var inputList = removingSpace.map { String($0) }
    print(inputList)
    var numlist = [Int]()
    var operatorList = [String]()
    var tempnum = " "
    var array = ["1","2","3","4","5","6","7","8","9","0","."]
    formnumber(numlist: numlist,operatorList: operatorList)
    solve(numlist: numlist,operatorList: operatorList)
    while (operatorList.contains("+")) || (operatorList.contains("-")) || (operatorList.contains("*")) || (operatorList.contains("/")) {
			solve(numlist: numlist,operatorList: operatorList)
    }
    var result = numlist[0]
}
func solveBracket(tempNum:String) -> [Int] 
{

    var removingSpace = input.replacingOccurrences(of: " ", with: "")
    var inputList = removingSpace.map { String($0) }
    print(inputList)
    var countInput = inputList.count
    var numlist = [Int]()
    var operatorList = [String]()
    var array = ["1","2","3","4","5","6","7","8","9","0","."]
    var tempNum = " "
    for (y,x) in inputList.enumerated(){
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
        if y+1 == countInput{
            if tempNum != " "{
               numlist.append(Int(tempNum)!)
               //print(numlist)
            }
        }
        } 
         while (operatorList.contains("+")) || (operatorList.contains("-")) || (operatorList.contains("*")) || (operatorList.contains("/")) {
			solve(numlist: numlist,operatorList: operatorList)
    }

   return numlist          
}

func formnumber(numlist: [Int], operatorList: [String]) -> ([Int],[String] )
{
    var removingSpace = input.replacingOccurrences(of: " ", with: "")
    var inputList = removingSpace.map { String($0) }
    var countInput = inputList.count
    var numlist = [Int]()
    var operatorList = [String]()
    var tempNum = " "
    var bracket = false
    for (y,x) in inputList.enumerated(){
        if String(x).contains("("){
            bracket = true
            continue
        } 
        else if (x).contains(")"){
            bracket = false
            solveBracket(tempNum:tempNum)
			numlist.append(Int(tempNum)!)
            continue
        }
        if bracket{
             tempNum = tempNum + String(x)
        }
        else{
            if tempNum != " "{
               numlist.append(Int(tempNum)!)
               //print(numlist)
            }
            tempNum == " "
            operatorList.append(String(x))
            print(operatorList)
            if y+1 == countInput{
            if tempNum != " "{
               numlist.append(Int(tempNum)!)
               //print(numlist)
            }
            }
        }
    }
   return (numlist,operatorList)
}
func solve(numlist: [Int], operatorList: [String]) -> ([Int],[String] )
{
    var numlists = numlist
    var operatorList = operatorList
    for(x,y) in operatorList.enumerated(){
        if y.contains("/"){
            numlists[x] = (numlists[x]) / numlists[x+1]
			numlists.remove(at:numlist[x+1])
			operatorList.remove(at:Int(y)!)
        }
    }
    for(x,y) in operatorList.enumerated(){
        if y.contains("*"){
            numlists[x] = (numlists[x]) * numlists[x+1]
			numlists.remove(at:numlist[x+1])
			operatorList.remove(at:Int(y)!)
        }
    }
    for(x,y) in operatorList.enumerated(){
        if y.contains("-"){
            numlists[x] = (numlists[x]) - numlists[x+1]
			numlists.remove(at:numlist[x+1])
			operatorList.remove(at:Int(y)!)
        }
    }
    for(x,y) in operatorList.enumerated(){
        if y.contains("+"){
            numlists[x] = (numlists[x]) +  numlists[x+1]
			numlists.remove(at:numlist[x+1])
			operatorList.remove(at:Int(y)!)
        }
    }
     return (numlist,operatorList)
}
