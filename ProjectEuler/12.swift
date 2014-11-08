//
//  12.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

import Foundation

func p12() -> Int {
    let limit = 100_000_000
    let minDivisorCount = 501

    /*
    var divisorsForNaturals = Array<Int>(count: limit, repeatedValue:0)

    var nextTriangle = 1, nextTriangleIncrement = 2

    for var natural = 1; natural < limit; natural++ {
        for var multiple = natural; multiple < limit; multiple += natural {
            ++divisorsForNaturals[multiple]
        }

        if natural == nextTriangle {
            let divisorCount = divisorsForNaturals[natural]
            // println("triangle \(natural): \(divisorCount) divisors")

            if minDivisorCount <= divisorCount {
                return natural
            }

            nextTriangle += nextTriangleIncrement
            ++nextTriangleIncrement
        }
    }
    */

    for var triangle = 1, nextIncrement = 2; true; triangle += nextIncrement, ++nextIncrement {
        var divisorCount = 2 // we know 1 is a divisor and so is triangle
        let limit = Int(ceil(sqrt(Double(triangle))))
        for var natural = 2; natural <= limit; ++natural {
            if triangle % natural == 0 {
                divisorCount += 2
            }
        }

        // println("triangle \(triangle): \(divisorCount) divisors")
        if minDivisorCount <= divisorCount {
            return triangle
        }
    }
}
