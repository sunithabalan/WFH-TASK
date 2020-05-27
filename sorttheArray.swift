/* To sort the array using any one of the algorithm ,
  that uses minimium number of swaps and also find the summation values by 
  subtracting from one element to other element till the index given.


input: Arrayofitems, indexvalue
output:Sorted array, swap count, Subtracted value
*/



import Foundation

let arrayToSort = [9, 22, 50, 10, 33, 41, 21, 40, 80, 60, 26]
let indexvalue  = 3
func performSelectionSort(tobeSorted: [Int],index:Int) {
   var arrayOfSortedelements = tobeSorted
   var numberOfSwap = 0
   for eachnumber in 0..<arrayOfSortedelements.count{
      var minimiumindex = eachnumber
          for eachvalues in eachnumber+1..<arrayOfSortedelements.count{
                       if arrayOfSortedelements[eachvalues] < arrayOfSortedelements[minimiumindex]{
                                 minimiumindex = eachvalues
                        }
             }        
           if minimiumindex != eachnumber{
                 arrayOfSortedelements.swapAt(minimiumindex,eachnumber)
                 numberOfSwap = numberOfSwap + 1
          }
    }
     print("The Result of sorted Array",arrayOfSortedelements)
     print("The number of swap taken is",numberOfSwap)
     
    var  sumOfSubtractedValues = 0
    var  eachiteration = 0
    while(eachiteration != index){
          sumOfSubtractedValues += arrayOfSortedelements[eachiteration] - arrayOfSortedelements[eachiteration + 1]
          eachiteration = eachiteration + 1
    }
    print("The summation value is",abs(sumOfSubtractedValues))
     
}
performSelectionSort(tobeSorted: arrayToSort,index:indexvalue)

v
