/*,
Need to calculate Electricity bill for every two months based on below tariffs.  
For domestic
For first 100 units Rs 0/unit
For next 100 units Rs 3.50/unit
For next 300 units Rs 4.60/unit
For unit above 500  Rs 6.60/unit
An additional surcharge of 20% is added to the bill
Get random numbers as daily consumable units. For domestic random number generation should be in between 1 - 10
*/

import Foundation
let bill = "Domestic"
var amount:Double = 0
var surcharge:Double = 0
var total = 0
let perDayUnit = Int.random(in:1...10)
let units  = perDayUnit * 60
if(units <= 100)
{
    amount = Double(units * 0)
    surcharge = 0
    total = Int(amount + surcharge)
    print("The Electricity bill is",total)
}
else if(units > 101 && units <= 200 )
{
    amount = (Double(units - 100) * 3.50)
    surcharge = 0.2
    total = Int(amount + surcharge)
    print("The Electricity bill is",total)
}
else if(units >= 201 && units <= 500)
{
    amount =  (Double(units - 100) * 3.50) + (Double(units - 200) * 4.60)
    surcharge = 0.2
    total = Int(amount + surcharge)
    print("The Electricity bill is",total)
  
}
else
{
    amount = Double(units) * 6.60
    surcharge = 0.3
    total = Int(amount + surcharge)
  print("The Electricity bill is",total)
}


