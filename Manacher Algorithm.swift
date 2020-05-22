import Foundation

func findLongestPalindromicString(text:String)
{
    var n = text.count
    var texts = [text]
    if n == 0{
        return 
    }
    n =  2 * n + 1
    var l : [Int] = [0,1]
    var center = 1
    var rights = 2
    var i = 0
    var imirror = 0
    var  maxLPSLength = 0
    var  maxLPSCenterPosition = 0
    var  start = -1
    var  end = -1
    var  diff = -1
    for i in 2..<35
    {
        imirror = 2 * center - i
        l[i] = 0
        diff = rights - i
        if diff > 0{
            l[i] = min(l[imirror], diff) 
            }
           while ((i + l[i]) < n && (i - l[i]) > 0) && (((i + l[i] + 1) % 2 == 0) || 
                    (texts[(i + l[i]+1) / 2] == texts[(i - l[i]-1) / 2])){
                l[i] += 1
                    }
            
         
            if l[i] > maxLPSLength{
            maxLPSLength = l[i] 
            maxLPSCenterPosition = i 
            }
            if i + l[i] > rights {
            center = i 
            rights = i + l[i] 
            }
    }
     start = (maxLPSCenterPosition - maxLPSLength) / 2
    end = start + maxLPSLength - 1
    print("LPS of string is " + text + " : ") 
    print( texts[ end + 1]) 

}

let text1 = "babcbabcbaccba"
findLongestPalindromicString(text:text1) 
 
