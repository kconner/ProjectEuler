//
//  17.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p17() -> Int {
    func wordForOnes(digit: Int) -> String {
        switch digit {
        case 1: return "one"
        case 2: return "two"
        case 3: return "three"
        case 4: return "four"
        case 5: return "five"
        case 6: return "six"
        case 7: return "seven"
        case 8: return "eight"
        case 9: return "nine"
        default: return ""
        }
    }

    func wordForTens(digit: Int) -> String {
        switch digit {
        case 1: return "ten"
        case 2: return "twenty"
        case 3: return "thirty"
        case 4: return "forty"
        case 5: return "fifty"
        case 6: return "sixty"
        case 7: return "seventy"
        case 8: return "eighty"
        case 9: return "ninety"
        default: return ""
        }
    }

    func wordForTeens(value: Int) -> String {
        switch value {
        case 11: return "eleven"
        case 12: return "twelve"
        case 13: return "thirteen"
        case 14: return "fourteen"
        case 15: return "fifteen"
        case 16: return "sixteen"
        case 17: return "seventeen"
        case 18: return "eighteen"
        case 19: return "nineteen"
        default: return ""
        }
    }

    func unspacedWordsForNumber(number: Int) -> String {
        var words = ""
        let decimal = BigDecimal(number)

        var anyBeforeTens = false

        let thousands = decimal.thousands
        if thousands != 0 {
            words.extend(wordForOnes(thousands))
            words.extend("thousand")
            anyBeforeTens = true
        }

        let hundreds = decimal.hundreds
        if hundreds != 0 {
            words.extend(wordForOnes(hundreds))
            words.extend("hundred")
            anyBeforeTens = true
        }

        let tensAndOnes = number % 100
        if tensAndOnes != 0 {
            if anyBeforeTens {
                words.extend("and")
            }

            if 11...19 ~= tensAndOnes {
                words.extend(wordForTeens(tensAndOnes))
            }
            else {
                let tens = decimal.tens
                words.extend(wordForTens(tens))

                let ones = decimal.ones
                words.extend(wordForOnes(ones))
            }
        }

        return words
    }

    var sum = 0
    for i in 1...1000 {
        let words = unspacedWordsForNumber(i)
        // println(words)
        sum += words.utf16Count
    }
    return sum
}
