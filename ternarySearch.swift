import Foundation
var leftvalue = 0
var rightvalue = 9
 func ternarySearch(key: Int, array: [Int])
 {
     while (rightvalue >= leftvalue){
         var middle1 = (leftvalue + (rightvalue - 1) / 3 )
         var middle2 = (rightvalue - (rightvalue - 1) / 3)
         if (key == array[middle1]){
             print( middle1)
         }
        if  (key == array[middle2]){
            print( middle2)
        }
        if (key < array[middle1]){
            rightvalue = middle1 - 1
        }
        else if  (key > array[middle2]){
            leftvalue = middle2 + 1
        }
        else{
            leftvalue = middle1 + 1
            rightvalue = middle2 - 1
        }
       print("The index is", middle2)
     }
 }
 var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] 
ternarySearch(key: 2,array : array)
