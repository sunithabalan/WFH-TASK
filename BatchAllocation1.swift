import Foundation
var orderValue = 100
let cases = 50
let outer = 5
var batch = [["avail": 50, "name": "B1", "cases":0, "outer": 0, "pieces": 0],
            ["avail": 25, "name": "B2", "cases":0, "outer": 0, "pieces": 0],
            ["avail": 125, "name": "B3", "cases":0, "outer": 0, "pieces": 0],
            ]
for each in 0..<batch.count
{

if batch[each]["avail"] as! Int >= cases, orderValue >= outer
{
    orderValue = orderValue - cases
    batch[each]["cases"] = batch[each]["cases"] as! Int + 1
    
}
else if batch[each]["avail"] as! Int >= outer, orderValue >= outer
{
    orderValue = orderValue - cases
    batch[each]["outer"] = batch[each]["outer"] as! Int + 1

}
}
print(batch)

