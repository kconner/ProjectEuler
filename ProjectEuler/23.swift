//
//  23.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/9/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

private func abundantNumbersUpTo(limit: Int) -> [Int] {
    var abundantNumbers: [Int] = []
    var divisorSums = Array<Int>(count: limit, repeatedValue: 1)

    for value in 2..<limit {
        for var multiple = value * 2; multiple < limit; multiple += value {
            divisorSums[multiple] += value
        }

        let divisorSum = divisorSums[value]
        if value < divisorSum {
            abundantNumbers.append(value)
        }
    }

    return abundantNumbers
}

func p23() -> Int {
    let limit = 28124
    let abundants = abundantNumbersUpTo(limit)

    var isSumOfTwoAbundants = Array(count: limit, repeatedValue: false)

    for index in abundants.startIndex..<abundants.endIndex {
        let n1 = abundants[index]
        for n2 in abundants[abundants.startIndex...index] {
            let sum = n1 + n2
            if limit <= sum {
                break
            }
            isSumOfTwoAbundants[sum] = true
        }
    }

    var finalSum = 0
    for number in 1..<limit {
        if !isSumOfTwoAbundants[number] {
            finalSum += number
        }
    }
    return finalSum
}
