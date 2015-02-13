//
//  33.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 2/12/15.
//  Copyright (c) 2015 Kevin Conner. All rights reserved.
//

func p33() -> Int {
    var product = (numerator: 1, denominator: 1)

    // Find the four fractions that qualify and accumulate their product.
    for tens1 in 1...9 {
        for ones1 in 0...9 {
            for tens2 in tens1...9 {
                for ones2 in 0...9 {
                    let numerator = tens1 * 10 + ones1
                    let denominator = tens2 * 10 + ones2
                    if (numerator < denominator) {
                        let quotient = Double(numerator) / Double(denominator)

                        if (Double(tens1) / Double(tens2) == quotient && ones1 == ones2 && !(ones1 == 0 && ones2 == 0))
                                || (Double(tens1) / Double(ones2) == quotient && ones1 == tens2)
                                || (Double(ones1) / Double(tens2) == quotient && tens1 == ones2)
                                || (Double(ones1) / Double(ones2) == quotient && tens1 == tens2) {
                            // println(String(format: "%d / %d = %f", numerator, denominator, quotient))
                            product = (product.numerator * numerator, product.denominator * denominator)
                        }
                    }
                }
            }
        }
    }

    // println(String(format: "%d / %d", product.numerator, product.denominator))

    // Reduce.
    var factor = 2
    while factor <= product.numerator {
        if product.numerator % factor == 0 && product.denominator % factor == 0 {
            product = (product.numerator / factor, product.denominator / factor)
            // println(String(format: "%d: %d / %d", factor, product.numerator, product.denominator))
            factor = 2
        } else {
            ++factor
        }
    }

    // println(String(format: "%d / %d", product.numerator, product.denominator))

    return product.denominator
}
