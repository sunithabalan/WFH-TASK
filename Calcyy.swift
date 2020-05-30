import Foundation
var input = " (1 + 2) * 4 + 5  "
var numlist = [Int]()
var operatorList = [String]()
func solveBracket() -> ([Int] ,[String])
{
    var removingSpace = input.replacingOccurrences(of: " ", with: "")
    var inputList = removingSpace.map { String($0) }
    print(inputList)
    var array = "1234567890"
    for character in inputList{
        if array.contains(character){
            numlist.append(Int(character)!)
        }
        else{
          operatorList.append(String(character))
        }
     }  
    
    return (numlist,operatorList)       
}

func solve(numlist: [Int], operatorList: [String]) -> ([Int],[String])
{
    var numlists = numlist
    var operatorList = operatorList
    for x in numlists{
        for y in operatorList{
            if y.contains("/"){
                numlists[x] = (numlists[x]) / numlists[x+1]
               
            }
            }
    }
    for x in numlists{
        for y in operatorList{
            if y.contains("*"){
                numlists[x] = (numlists[x]) / numlists[x+1]
            }
            }
            }
    return (numlist,operatorList)
}
let res = solveBracket() 
let solves = solve(numlist: numlist, operatorList: operatorList)
