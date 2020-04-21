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
Get random numbers as daily consumable units. For domestic random number generation should be in between 1 - 10. For commercial 10 - 100
*/
import Foundation
//using enum for readingType
enum readingType:String {
    case domestic = "domestic"
    case commercial = "Commercial"
}
var calculatingUnit:Double = 0
var totalAmountTobePaid:Double = 0
//Empty array for storing 60days of random units
var perDayUnitFortwoMonth : [Int] = []
//Function for calculting the Domestic BillType
func billTypeForDomestic(billtype:readingType)
{
//FixedCharge for all DomesticType
let surchargeForDomestic:Double = 50
//Charges for 100 200 and above 500 units
let domesticFirstHundredUnitCharge = 0
let domesticNextHundredUnitCharge = 3.50
let domesticNextThreeHundredUnitCharge = 4.60
let domesticAboveFiveHundredUnitCharge = 6.60
//Geting random units for twomonth and storing into empty array
for eachday in 0..<60
{
let perDayUnit = Int.random(in:1...10)
perDayUnitFortwoMonth.append(perDayUnit)
}
let units  = perDayUnitFortwoMonth.reduce(0,+)
print("The unit for two month is", units)
//Calculating units
if(units <= 100)
{
    calculatingUnit = Double(units * domesticFirstHundredUnitCharge)
}
//Calculation above 100units
else if(units >= 101 && units <= 200 )
{
    calculatingUnit = Double(units * domesticFirstHundredUnitCharge) + (Double(100) * domesticNextHundredUnitCharge) 
}
//Calculation above  200units
else if(units >= 201 && units <= 500)
{
    calculatingUnit =  Double(units * domesticFirstHundredUnitCharge) + (Double(100) * domesticNextHundredUnitCharge) + (Double(units - 200) * domesticNextThreeHundredUnitCharge) 
}
//Calculation above 500units
else
{
   calculatingUnit = Double(units * domesticFirstHundredUnitCharge) + (Double(100) * domesticNextHundredUnitCharge) + (Double(300) * domesticNextThreeHundredUnitCharge)
    + Double(units) * domesticAboveFiveHundredUnitCharge
}
totalAmountTobePaid = Double(calculatingUnit + surchargeForDomestic)
print("The Electricity bill for Domestic is is",totalAmountTobePaid)
}
//Function for calculating the Commercial BillType
func billTypeForCommercial(billtype:readingType)
{
//FixedCharge for all CommercialType
let surchargeForCommercial:Double  = 290
//Charges for 100 and above 500 units
let commericalHundredUnitCharge = 5.00
let commericalAboveHundredUnitCharge = 8.05
////Geting random units for twomonth and storing into empty array
for eachday in 0..<60
{
let perDayUnit = Int.random(in:10...100)
perDayUnitFortwoMonth.append(perDayUnit)
}
//Higherorder function for getting twomonth units
let units  = perDayUnitFortwoMonth.reduce(0,+)
print("The unit for two month  is", units)
//Calculation for 100units
if(units <= 100)
{
    calculatingUnit = Double(units) * commericalHundredUnitCharge 
}
//Calculation above 100units
else
{
    calculatingUnit =  Double(units) * commericalHundredUnitCharge  + Double(units - 100) * commericalAboveHundredUnitCharge
}
totalAmountTobePaid = Double(calculatingUnit + surchargeForCommercial)
print("The Electricity bill for Commercial is",totalAmountTobePaid)
}
//Function call using enum
let domesticBill = billTypeForDomestic(billtype:readingType.domestic)
let commercialBill = billTypeForCommercial(billtype:readingType.commercial)
