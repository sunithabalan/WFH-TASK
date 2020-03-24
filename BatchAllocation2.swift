import Foundation

var orderValue = 100
let cases = 50
let outer = 5
var batch = [["avail": 50, "name": "B1", "cases":0, "outer": 0, "pieces": 0],
            ["avail": 25, "name": "B2", "cases":0, "outer": 0, "pieces": 0],
            ["avail": 125, "name": "B3", "cases":0, "outer": 0, "pieces": 0],
            ]
var values = 0
for each in 0..<batch.count
{

if batch[each]["avail"] as! Int >= cases, orderValue >= cases
{
    
    values = batch[each]["avail"] as! Int / cases
    batch[each]["cases"] = batch[each]["cases"] as! Int + values
    batch[each]["avail"] = batch[each]["avail"] as! Int - cases 
     
}
else if batch[each]["avail"] as! Int >= outer, orderValue >= outer
{

    values = batch[each]["avail"] as! Int / outer
    batch[each]["outer"] = batch[each]["outer"] as! Int + values
    batch[each]["avail"] = batch[each]["avail"] as! Int - outer
}

}
print(batch)
