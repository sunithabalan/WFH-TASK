import Foundation
var orderValue = 100
let cases = 50
let outer = 5
let piece = 1
var batch = [["avail": 50, "name": "B1", "cases":0, "outer": 0, "pieces": 0],
            ["avail": 25, "name": "B2", "cases":0, "outer": 0, "pieces": 0],
            ["avail": 125, "name": "B3", "cases":0, "outer": 0, "pieces": 0],
            ]
var  valuesOfCase = 0
var  valuesOfOrder = 0

for product in 0..<batch.count
{

if batch[product]["avail"] as! Int >= cases, orderValue >= cases , cases > 0
{  
   valuesOfCase = batch[product]["avail"] as! Int / cases
   valuesOfOrder = orderValue / cases
    if valuesOfCase<valuesOfOrder
    {
        batch[product]["cases"] = batch[product]["cases"] as! Int + valuesOfCase
        batch[product]["avail"] = batch[product]["avail"] as! Int - (valuesOfCase * cases)
        orderValue =  orderValue - (valuesOfCase * cases)
    }
     else
     {
         batch[product]["cases"] = batch[product]["cases"] as! Int + valuesOfOrder
         batch[product]["avail"] = batch[product]["avail"] as! Int - (valuesOfOrder * cases)
         orderValue =  orderValue - (valuesOfOrder * cases)
  
     }
}
else if batch[product]["avail"] as! Int >= outer, orderValue >= outer, outer > 0
 {
   valuesOfCase = batch[product]["avail"] as! Int / outer
   valuesOfOrder = orderValue / outer
    if valuesOfCase<valuesOfOrder
    {
     batch[product]["outer"] = batch[product]["outer"] as! Int + valuesOfCase
     batch[product]["avail"] = batch[product]["avail"] as! Int - (valuesOfCase * outer)
     orderValue =  orderValue - (valuesOfCase * outer)
    }
    else
    {
    batch[product]["outer"] = batch[product]["outer"] as! Int + valuesOfOrder
    batch[product]["avail"] = abs( batch[product]["avail"] as! Int - (valuesOfOrder * outer) )
    orderValue =  orderValue - (valuesOfOrder * outer)
    }
 }
 else if batch[product]["avail"] as! Int >= piece, orderValue >= piece, piece > 0
 {
   valuesOfCase = batch[product]["avail"] as! Int / outer
   valuesOfOrder = orderValue / outer
    if valuesOfCase<valuesOfOrder
    {
     batch[product]["pieces"] = batch[product]["pieces"] as! Int + valuesOfCase
     batch[product]["avail"] = batch[product]["avail"] as! Int - (valuesOfCase * outer)
     orderValue =  orderValue - (valuesOfCase * outer)
    }
    else
    {
    batch[product]["pieces"] = batch[product]["pieces"] as! Int + valuesOfOrder
    batch[product]["avail"] = abs( batch[product]["avail"] as! Int - (valuesOfOrder * outer) )
    orderValue =  orderValue - (valuesOfOrder * outer)
    }
 }

}
 print(batch)
