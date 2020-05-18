import Foundation
func search(pattern:String, text:String)
{
    var m = pattern.count
    var n = text.count
    var pat = [pattern]
    var txt = [text]
    var value = n - m + 1
    for i in 0..<value
    {
    var j = 0
        while(j < m)
        {
             if (txt[i + j] != pat[j]){
                break
             }
        j += 1
        }
        if (j == m){ 
            print("Pattern found at index ", i)
        }
    }
}
let  text = "AABAACAADAABAAABAA"
let  pattern = "AABA"
search(pattern:pattern, text:text) 

import Foundation
func search(pattern:String, text:String)
{
    let m = pattern.count
    let n = text.count
    var pat = [pattern]
    var txt = [text]
    var i = 0
     
    while(i <= n-m){
      var j = 0
      for j in 0..<m{
        if txt[i+j] != pat[j]{
          break
        }
        j = j + 1
      }
      if j == m {
         print ("Pattern found at index ",i) 
         i = i + m
      }
      else if j == 0 {
        i = i + 1
      }
      else {
        i = i + j 
      }
    }
}
let  text = "AABAACAADAABAAABAA"
let  pattern = "AABA"
search(pattern:pattern, text:text) 
