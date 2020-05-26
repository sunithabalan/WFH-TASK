import Foundation
let arrayToSort = [9, 22, 50, 10, 33, 41, 21, 40, 80, 60, 26]
func performSelectionSort(tobeSorted: [Int]) {
   var result = tobeSorted
   var count = 0
   for eachnumber in 0..<result.count{
      var minimiumindex = eachnumber
      for eachvalues in eachnumber+1..<result.count{
         if result[eachvalues] < result[minimiumindex]{
           minimiumindex = eachvalues
        }
        }        
       if minimiumindex != eachnumber{
          result.swapAt(minimiumindex,eachnumber)
          count = count + 1
          }
    }
     print(result)
     print(count)
     
}

performSelectionSort(tobeSorted: arrayToSort)
