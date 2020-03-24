import Foundation

var orderValue = 100
let cases = 50
let outer = 5
var batch = [["avail": 150, "name": "B1", "cases":0, "outer": 0, "pieces": 0],
            ["avail": 25, "name": "B2", "cases":0, "outer": 0, "pieces": 0],
            ["avail": 125, "name": "B3", "cases":0, "outer": 0, "pieces": 0],
            ]
var values = 0
var  values1 = 0
var balance = 0
for each in 0..<batch.count
{

if batch[each]["avail"] as! Int >= cases, orderValue >= cases
{  
    values = batch[each]["avail"] as! Int / cases
    values1 = orderValue / cases
    batch[each]["cases"] = batch[each]["cases"] as! Int + values1
    batch[each]["avail"] = abs(batch[each]["avail"] as! Int - (values1 * cases))
     
}
else if batch[each]["avail"] as! Int >= outer, orderValue >= outer
 {
     values = batch[each]["avail"] as! Int / outer
     values1 = orderValue / outer
     batch[each]["outer"] = batch[each]["outer"] as! Int + values1
     batch[each]["avail"] = abs( batch[each]["avail"] as! Int - (values1 * outer))
}

 }
 print(batch)
