//
//  21.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/9/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p21() -> Int {
    let limit = 10000
    var divisorSums: [Int] = Array<Int>(count: limit, repeatedValue: 1)

    var amicableNumbersSum = 0
    for value in 2..<limit {
        for var multiple = value * 2; multiple < limit; multiple += value {
            divisorSums[multiple] += value
        }

        let other = divisorSums[value]
        if other < value && divisorSums[other] == value {
            amicableNumbersSum += value
            amicableNumbersSum += other
        }
    }

    return amicableNumbersSum
}
