//
//  34.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 2/17/15.
//  Copyright (c) 2015 Kevin Conner. All rights reserved.
//

private func factorial(index: Int) -> Int {
    return index <= 1 ? 1 : index * factorial(index - 1)
}

private let factorials = map(0...9, factorial)

private func sumForDecimalPlace(place: Int, parentDecimalSum: Int, parentFactorialSum: Int, digitRange: Range<Int>) -> Int {
    var resultSum = 0

    for digit in digitRange {
        let decimalSum = parentDecimalSum * 10 + digit
        let factorialSum = parentFactorialSum + factorials[digit]

        if 0 < place {
            resultSum += sumForDecimalPlace(place - 1, decimalSum, factorialSum, 0...9)
        } else if decimalSum == factorialSum {
            resultSum += decimalSum
        }
    }

    return resultSum
}

func p34() -> Int {
    var resultSum = 0

    // 2 digits, 3 digits…
    for digitCount in 2...5 {
        // Loop over each digit's values, with significant digits major: First place: 1-9, latter places 0-9.
        resultSum += sumForDecimalPlace(digitCount - 1, 0, 0, 1...9)
    }

    return resultSum
}
