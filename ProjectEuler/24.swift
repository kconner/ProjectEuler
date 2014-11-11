//
//  24.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/9/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p24() -> Int {
    let placeCount = 10

    var factorials = [1]
    var factorial = 1
    for var factor = 1; factor <= placeCount; factorial *= ++factor {
        factorials.append(factorial)
    }

    var sequenceOffset = 1_000_000 - 1
    var availableDigits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    var digits: [Int] = []
    for var place = placeCount; 1 <= place; --place {
        // Digit n swaps out every (n-1)!
        var factorial = factorials[place - 1]
        let subsequencesPassed = sequenceOffset / factorial
        digits.append(availableDigits.removeAtIndex(subsequencesPassed))
        sequenceOffset %= factorial
    }

    return BigInt(digits: digits.reverse()).intValue
}
