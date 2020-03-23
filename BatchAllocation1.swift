import Foundation
var ordervalue = 100
let cases1 = 50
let outer1 = 5
var total_available = 0
var batch = [["avail": 50, "name": "B1", "cases":0, "outer": 0, "pieces": 0],
            ["avail": 25, "name": "B2", "cases":0, "outer": 0, "pieces": 0],
            ["avail": 125, "name": "B3", "cases":0, "outer": 0, "pieces": 0],
           
            ]
for each in 0..<batch.count
{

if batch[each]["avail"] as! Int >= cases1, ordervalue >= outer1
{
    ordervalue = ordervalue - cases1
    batch[each]["cases"] = batch[each]["cases"] as! Int + 1
    total_available = total_available - cases1
}
else if batch[each]["avail"] as! Int >= outer1, ordervalue >= outer1
{
    ordervalue = ordervalue - cases1
    batch[each]["outer"] = batch[each]["outer"] as! Int + 1

}
}
print(batch)
print(total_available)
