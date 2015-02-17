//
//  36.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 2/17/15.
//  Copyright (c) 2015 Kevin Conner. All rights reserved.
//

func p36() -> Int {
    var resultSum = 0

    for amount in stride(from: 1, to: 1_000_000, by: 2) {
        var binary = Bits(amount)
        if binary == binary.reverse() {
            var decimal = BigInt(amount)
            if decimal == decimal.reverse() {
                resultSum += amount
            }
        }
    }

    return resultSum
}
