import Foundation
 var verticesEdgesWeight = [[1,2,8],[2,3,1],[2,6,3],[3,6,7],[4,3,4],[1,4,6]]
 var  weights = [Int]()
 for each in verticesEdgesWeight
 {
     weights.append(each[2])

 }
let sortedWeights = weights.map({ $0 < $1})
