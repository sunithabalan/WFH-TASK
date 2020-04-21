/*Problem Statement : Need to calculate Electricity bill for every two months based on below tariffs.  
For domestic
For first 100 units Rs 0/unit
For next 100 units Rs 3.50/unit
For next 300 units Rs 4.60/unit
For unit above 500  Rs 6.60/unit
Fixed charges for two months Rs.50/service
For Commercial
For first 100 units Rs 5.00/unit
Consumption above 100 units bi monthly 8.05/unit
Fixed charges for two months Rs.290/service
Get random numbers as daily consumable units. For domestic random number generation should be in between 1 - 10. For commercial 10 - 100*/

import Foundation
//using enum for readingType
enum readingType:String {
    case domestic = "domestic"
    case commercial = "Commercial"
}

func unitCalculation(startingValue:Int,endingValue:Int)-> Double {
var perDayUnitFortwoMonth : [Int] = []
         for eachday in 0..<60
               {
                  let perDayUnit = Int.random(in: startingValue...endingValue)
                  perDayUnitFortwoMonth.append(perDayUnit)
               }
   let calculatedUnit  = perDayUnitFortwoMonth.reduce(0,+)
     return Double(calculatedUnit)
}

func billCalculation(units: Double, tariffValue: Double, tariffCharge: Double) -> Double {
   var  calculatedAmount = Double(units - tariffValue) * tariffCharge
    return calculatedAmount
}
var calculatingUnit:Double = 0
var totalAmountTobePaid:Double = 0
func billTypeForDomestic(billtype:readingType)
{
let surchargeForDomestic:Double = 50
let costOfHunderedUnits: Double = (100 * 3.50)
let costOfThreeHunderedUnits: Double = (300 * 4.60)
let calcalutedUnits = unitCalculation(startingValue:1,endingValue:10)
print("The unit for two month is",calcalutedUnits)
if(calcalutedUnits <= 100)
{
    calculatingUnit = billCalculation(units: calcalutedUnits, tariffValue: 0, tariffCharge: 0)
}
//Calculation above 100units
else if(calcalutedUnits >= 101 && calcalutedUnits <= 200 )
{
    calculatingUnit = billCalculation(units: calcalutedUnits, tariffValue: 100, tariffCharge: 3.50) 
}
//Calculation above  200units
else if(calcalutedUnits >= 201 && calcalutedUnits <= 500)
{
    calculatingUnit =  billCalculation(units: calcalutedUnits, tariffValue: 200, tariffCharge: 4.60)  + costOfHunderedUnits
}
//Calculation above 500units
else
{
   calculatingUnit = billCalculation(units: calcalutedUnits, tariffValue: 500, tariffCharge: 6.50)  + costOfHunderedUnits + costOfThreeHunderedUnits
}
totalAmountTobePaid = Double(calculatingUnit + surchargeForDomestic)
print("The Electricity bill for Domestic is is",totalAmountTobePaid)
}
func billTypeForCommercial(billtype:readingType)
{
//FixedCharge for all CommercialType
let surchargeForCommercial:Double  = 290
let costofHundredUnits = (100 * 5.0)
let calcalutedUnits = unitCalculation(startingValue:10,endingValue:100)
print("The unit for two month is",calcalutedUnits)
if (calcalutedUnits <= 100)
{
     calculatingUnit = billCalculation(units: calcalutedUnits, tariffValue: 0, tariffCharge: 5.0)
}
else
{
    calculatingUnit = billCalculation(units: calcalutedUnits, tariffValue: 100, tariffCharge: 8.05) + costofHundredUnits
}
totalAmountTobePaid = Double(calculatingUnit + surchargeForCommercial)
print("The Electricity bill for Commercial is",totalAmountTobePaid)
}//Function call using enum
let domesticBill = billTypeForDomestic(billtype:readingType.domestic)
let commercialBill = billTypeForCommercial(billtype:readingType.commercial)
