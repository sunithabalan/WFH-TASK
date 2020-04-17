// Need to calculate Electricity bill for every two months based on below tariffs.  
// For domestic
// For first 100 units Rs 0/unit
// For next 100 units Rs 3.50/unit
// For next 300 units Rs 4.60/unit
// For unit above 500  Rs 6.60/unit
// Fixed charges for two months Rs.50/service
// For Commercial
// For first 100 units Rs 5.00/unit
// Consumption above 100 units bi monthly 8.05/unit
// Fixed charges for two months Rs.290/service
// Get random numbers as daily consumable units. For domestic random number generation should be in between 1 - 10. For commercial 10 - 100

import Foundation
enum readingType:String {
    case domestic,commerical
}
var calculatingUnit:Double = 0
var totalAmountTobePaid:Double = 0
var perDayUnitFortwoMonth : [Int] = []
let domesticFirstHundredUnitCharge = 0
let domesticTwoHundredUnitCharge = 3.50
let domesticThreeHundredUnitCharge = 4.60
let domesticAboveFiveHundredUnitCharge = 6.60
let commericalHundredUnitCharge = 5.00
let commericalAboveHundredUnitCharge = 8.05
func billTypeForDomestic(billtype:String)
{
let surchargeForDomestic:Double = 50
for eachday in 0..<60
{
let perDayUnit = Int.random(in:1...10)
perDayUnitFortwoMonth.append(perDayUnit)
}
let units  = perDayUnitFortwoMonth.reduce(0,+)
print("The unit for two month is", units)
if(units <= 100)
{
    calculatingUnit = Double(units * domesticFirstHundredUnitCharge)
    totalAmountTobePaid = Double(calculatingUnit + surchargeForDomestic)
    print("The Electricity bill for domestic is",totalAmountTobePaid)
}
else if(units >= 101 && units <= 200 )
{
    calculatingUnit = Double(units * domesticFirstHundredUnitCharge) + (Double(units - 100) * domesticTwoHundredUnitCharge)
    totalAmountTobePaid = Double(calculatingUnit + surchargeForDomestic)
    print("The Electricity bill for domestic is",totalAmountTobePaid)
}
else if(units >= 201 && units <= 500)
{
    calculatingUnit =  Double(units * domesticFirstHundredUnitCharge) + (Double(200 - 100) * domesticTwoHundredUnitCharge) + (Double(units - 200) * domesticThreeHundredUnitCharge)
    totalAmountTobePaid = Double(calculatingUnit + surchargeForDomestic)
    print("The Electricity bill for domestic is",totalAmountTobePaid)
  
}
else
{
    calculatingUnit = Double(units) * domesticAboveFiveHundredUnitCharge
   totalAmountTobePaid = Double(calculatingUnit + surchargeForDomestic)
    print("The Electricity bill is",totalAmountTobePaid)
}
}

func billTypeForCommercial(billtype:String)
{
let surchargeForCommercial:Double  = 290
for eachday in 0..<60
{
let perDayUnit = Int.random(in:10...100)
perDayUnitFortwoMonth.append(perDayUnit)
}
let units  = perDayUnitFortwoMonth.reduce(0,+)
print("The unit is", units)
  
if(units >= 100)
{
    calculatingUnit = Double(units) * commericalHundredUnitCharge 
    totalAmountTobePaid = Double(calculatingUnit + surchargeForCommercial)
    print("The Electricity bill for Commercial is",totalAmountTobePaid)
}
else
{
    calculatingUnit =  Double(units) * commericalHundredUnitCharge  + Double(units - 100) * commericalAboveHundredUnitCharge
    totalAmountTobePaid = Double(calculatingUnit + surchargeForCommercial)
    print("The Electricity bill for Commercial is",totalAmountTobePaid)

}
}
let type = "domestic"
if readingType.domestic.rawValue == type
{
     billTypeForDomestic(billtype:"Domestic")
}
else
{
     billTypeForCommercial(billtype:"Commercial")
}
