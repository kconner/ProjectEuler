//
//  26.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/13/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p26() -> Int {
    var maxRepeatingDigitCount = (divisor: 0, count: 0)

    let dividend = 1
    for divisor in 1..<1000 {
        var partialDividendIndices: [Int: Int] = [:]
        var partialDividend = dividend
        var index = 0

        // When partialDividend == 0, quit long division since there was no remainder.
        while partialDividend != 0 {
            // Consider whether we have done this long division step before, and how long ago.
            if let previousIndex = partialDividendIndices[partialDividend] {
                // Quit doing long division, we found a repeating decimal in the sequence.
                let repeatingDigitCount = index - previousIndex
                if maxRepeatingDigitCount.count < repeatingDigitCount {
                    maxRepeatingDigitCount = (divisor: divisor, count: repeatingDigitCount)
                }
                break
            } else {
                // Remember that we did this step and when.
                partialDividendIndices[partialDividend] = index
                ++index
            }

            // Do the long division step.
            partialDividend = partialDividend % divisor * 10
        }
    }

    return maxRepeatingDigitCount.divisor
}
