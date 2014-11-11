//
//  16.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p16() -> Int {
    // Begin at 2^0, then raise to 2^1000
    var decimal = BigInt(1)

    for power in 1...1000 {
        decimal = decimal.multipliedBy(2)
    }

    return decimal.digits.reduce(0, combine: +)
}
