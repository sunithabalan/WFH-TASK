import Foundation
import Glibc
import Foundation
func knapsack(w:Int, weight:[Int], value:[Int], number:Int) 
{
  var k =  Array(repeating: Array(repeating: 1,count: w+1), count: number+1)
  for i in 0..<number
  {
    for j in 0..<w
    {
      if (i == 0) || (j == 0){
        k[i][j] = 0
      }
      else if (weight[i - 1] <= j){
        k[i][j] = max(value[i - 1] + k[i - 1][j - weight[i - 1]], k[i - 1][j])
        print(  k[i][j])
      }
      else{
        k[i][j] = k[i - 1][j]
      }
    }
   
  }
 print(k[number][w])  
  
  
}
let totalweight = 50
let weights = [10, 20, 30] 
let values = [60, 100, 120]
let number = 3
print(knapsack(w: totalweight, weight: weights, value: values, number:number)) 
