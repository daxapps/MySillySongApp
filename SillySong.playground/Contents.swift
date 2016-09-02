//: Playground - noun: a place where people can play

import UIKit
import Foundation

func shortNameFromName(name: String) -> String {
    
    let lowercaseName = name.lowercaseString
    let vowelSet = NSCharacterSet(charactersInString: "aeiou")
    
    if let firstVowelRange = lowercaseName.stringByFoldingWithOptions(.DiacriticInsensitiveSearch, locale: nil).rangeOfCharacterFromSet(vowelSet) {
        
        return lowercaseName.substringFromIndex(firstVowelRange.startIndex)
    }
    
    return lowercaseName
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joinWithSeparator("\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameFromName(fullName)
    
    let song = lyricsTemplate.stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: fullName).stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortName)
    
    return song
}

//print(lyricsForName(bananaFanaTemplate, fullName: "Nate"))
print(lyricsForName(bananaFanaTemplate, fullName: "Zöe"))

