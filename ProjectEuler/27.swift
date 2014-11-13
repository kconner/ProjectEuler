//
//  27.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/13/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p27() -> Int {
    var mostPrimes = (count: 0, productOfCoefficients: 0)

    var sieve = PrimeSieve(max: 100_000)
    for a in -999...999 {
        for b in -999...999 {
            var n = 0
            var y: Int
            do {
                y = n * n + a * n + b
                ++n
            } while sieve[y]

            let primeCount = n - 1
            if mostPrimes.count < primeCount {
                mostPrimes = (count: primeCount, productOfCoefficients: a * b)
            }
        }
    }

    return mostPrimes.productOfCoefficients
}
