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
