import Foundation
import Glibc
 
func knapsack(w:Int, weight:[Int], value:[Int], number:Int) -> Int
{
  var k =  Array(repeating: Array(repeating: 0,count: w+1), count: number+1)
 
  for i in 0..<number+1
  {
    for j in 0..<w+1
    {
      if (i == 0) || (j == 0) {
        k[i][j] = 0
      } else if (weight[i - 1] <= j) {
        k[i][j] = max(value[i - 1] + k[i - 1][j - weight[i - 1]], k[i - 1][j])
      } else {
        k[i][j] = k[i - 1][j]
      }
    }
  }
return k[number][w]
}
let totalweight = 50

let weights = [10, 20, 30] 
let values = [60, 100, 120]
let number = values.count
print(knapsack(w: totalweight, weight: weights,value: values, number:number))
