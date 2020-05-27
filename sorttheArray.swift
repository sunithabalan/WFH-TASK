/* To sort the array using any one of the algorithm ,
  that uses minimium number of swaps and also find the summation values by 
  subtracting from one element to other element till the index given.


input: Arrayofitems, indexvalue
output:Sorted array, swap count, Subtracted value
*/

import Foundation

let arrayToSort = [7,5,4,2,1]
let indexvalue  = 3
func performSelectionSort(tobeSorted: [Int],index:Int) {
   var arrayOfSortingelements = tobeSorted
   var numberOfSwap = 0
   for eachnumber in 0..<arrayOfSortingelements.count{
      var minimiumindex = eachnumber
          for eachvalues in eachnumber+1..<arrayOfSortingelements.count{
                       if arrayOfSortingelements[eachvalues] < arrayOfSortingelements[minimiumindex]{
                                 minimiumindex = eachvalues
                        }
             }        
            if minimiumindex != eachnumber{
                 arrayOfSortingelements.swapAt(minimiumindex,eachnumber)
                 numberOfSwap = numberOfSwap + 1
          }
    }
    print("The Result of sorted Array",arrayOfSortingelements)
    print("The number of swap taken is",numberOfSwap)
     //Finding the minimium value after sorting
    var  sumOfSubtractedValues = 0
    var  eachiteration = 0
            while(eachiteration != index){
                     sumOfSubtractedValues += arrayOfSortingelements[eachiteration] - arrayOfSortingelements[eachiteration + 1]
                     eachiteration = eachiteration + 1
             }
            print("The summation value is",abs(sumOfSubtractedValues))
 }
performSelectionSort(tobeSorted: arrayToSort,index:indexvalue)

