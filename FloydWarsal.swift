import Foundation

var vertices = 4
var INF = 9999
func floydWharsall(matrix:[[Int]])
{
    var distancebetweenvertices =  Array(repeating: Array(repeating: 0,count: vertices), count: vertices)
for i in 0..<vertices
{
    for j in 0..<vertices
    {
       distancebetweenvertices[i][j] = matrix[i][j]
    }
}
for k in 0..<vertices
{
    for i in 0..<vertices
    {
         for j in 0..<vertices
         {
           distancebetweenvertices[i][j] = min(distancebetweenvertices[i][j], distancebetweenvertices[i][k] +
                                              distancebetweenvertices[k][j])
         }
    }
}
caltheSolution(distanceOfAlThepairs:distancebetweenvertices)

}
func caltheSolution(distanceOfAlThepairs:[[Int]])
{
  for i in 0..<vertices
    {
        for j in 0..<vertices
         {
             if (distanceOfAlThepairs[i][j] == INF) {
                 print("INF",terminator: " ")
             }
             else{
                 print(distanceOfAlThepairs[i][j],terminator: " ")
             }
           
         }
           print( " ")
    }
}
let matrix = [[0, 3, INF, 5],
         [2, 0, INF, 4],
         [INF, 1, 0, INF],
         [INF, INF, 2, 0]]; 
let result = floydWharsall(matrix:matrix)
