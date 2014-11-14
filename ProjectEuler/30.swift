//
//  30.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/13/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

private func pow(a: Int, b: Int) -> Int {
    if b == 0 {
        return 1
    } else {
        return a * pow(a, b - 1)
    }
}

func p30() -> Int {
    let fifthPowers = (0...9).map { pow($0, 5) }

    var sum = 0

    var digits: [Int] = [0, 1, 0, 0, 0, 0] // 10
    var sumOfFifthPowers = digits.map { fifthPowers[$0] }.reduce(0, +)

    for value in 10..<1_000_000 {
        if value == sumOfFifthPowers {
            sum += value
        }

        // roll digits forward
        for place in 0..<digits.count {
            let digit = digits[place]
            sumOfFifthPowers -= fifthPowers[digit]

            if digit == 9 {
                let newDigit = 0
                digits[place] = newDigit
                sumOfFifthPowers += fifthPowers[newDigit]
            } else {
                let newDigit = digit + 1
                digits[place] = newDigit
                sumOfFifthPowers += fifthPowers[newDigit]
                break
            }
        }
    }
    return sum
}
