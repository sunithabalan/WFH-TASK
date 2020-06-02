/* To sort the array using any one of the algorithm ,
  that uses minimium number of swaps and also find the summation values by 
  subtracting from one element to other element till the index given.


input: Arrayofitems, indexvalue
output:Sorted array, swap count, Subtracted value
*/

import Foundation
let sizeOfArray =  5
let indexValue = 3
var arrayOfElements = [7,5,4,3,2]
//Sorting the elements
func performSelectionSortToFindMinimumSwapAndSortedArray(from arrayOfElements:[Int]) -> (Int,[Int]) {
    var arrayOfElements = arrayOfElements
    var numberOfSwap = 0
    for currentValue in 0..<arrayOfElements.count{
        var minimumIndex = currentValue
            for eachValues in (currentValue + 1)..<arrayOfElements.count{
                if arrayOfElements[eachValues] < arrayOfElements[minimumIndex]{
                    minimumIndex = eachValues
                    }
                    }           
                    if minimumIndex != currentValue{
                     arrayOfElements.swapAt(minimumIndex,currentValue)
                       numberOfSwap = numberOfSwap + 1
                     }
        }
    return (numberOfSwap,arrayOfElements)
}
//Calculating the smallestvalue
func calculateSumOfSubtractedValuesInArray(till indexValue: Int) -> Int {
   var sumOfSubtractedValues = 0
   var  eachIteration = 0
   while(eachIteration != indexValue){
        sumOfSubtractedValues += arrayOfElements[eachIteration] - arrayOfElements[eachIteration + 1]
        eachIteration = eachIteration + 1
        }
        return abs(sumOfSubtractedValues)
}

//Calling the function
var resultOfSortedArrayAndSwapcount = performSelectionSortToFindMinimumSwapAndSortedArray(from:arrayOfElements)
let resultOfSortedArray = resultOfSortedArrayAndSwapcount.1
let swapCount = resultOfSortedArrayAndSwapcount.0
print("The Result of sorted Array is",resultOfSortedArray)
print("The number of swap count is",swapCount)

//checking Index range within the size of the Array
if indexValue > 0 && indexValue < sizeOfArray {
  print("Summation of subtracted values is \(calculateSumOfSubtractedValuesInArray(till: indexValue))")
}
else {
  print("Invalid index values")
}
