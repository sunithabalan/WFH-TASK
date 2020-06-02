/* To sort the array using any one of the algorithm ,
  that uses minimium number of swaps and also find the summation values by 
  subtracting from one element to other element till the index given.


input: Arrayofitems, indexvalue
output:Sorted array, swap count, Subtracted value
*/

import Foundation
let sizeOfArray =  5
let indexValue = 3
var arrayToSort = [7,5,4,3,2]
//Sorting the elements
func performSortToFindMinimumSwap() -> Int {
    var numberOfSwap = 0
    for currentValue in 0..<arrayToSort.count{
        var minimumIndex = currentValue
            for eachValues in (currentValue + 1)..<arrayToSort.count{
                if arrayToSort[eachValues] < arrayToSort[minimumIndex]{
                    minimumIndex = eachValues
                    }
                    }           
                    if minimumIndex != currentValue{
                       arrayToSort.swapAt(minimumIndex,currentValue)
                       numberOfSwap = numberOfSwap + 1
                     }
        }
    return numberOfSwap
}
//Calculating the smallestvalue
func performCalculationToFindSmallestValue(indexValue: Int) -> Int {
   var sumOfSubtractedValues = 0
   var  eachIteration = 0
   while(eachIteration != indexValue){
        sumOfSubtractedValues += arrayToSort[eachIteration] - arrayToSort[eachIteration + 1]
        eachIteration = eachIteration + 1
        }
        return abs(sumOfSubtractedValues)
}

//Calling the function
var swapCount = performSortToFindMinimumSwap()
print("The Result of sorted Array is",arrayToSort)
print("The number of swap count is",swapCount)

//checking Index range within the size of the Array
if indexValue > 0 && indexValue < sizeOfArray {
  print("Summation of subtracted values is \(performCalculationToFindSmallestValue(indexValue: indexValue))")
}
else {
  print("Invalid index values")
}
