//
//  35.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 2/17/15.
//  Copyright (c) 2015 Kevin Conner. All rights reserved.
//

func p35() -> Int {
    let limit = 999_999
    let sieve = PrimeSieve(max: limit)

    var resultCount = 0

    for prime in sieve.primeSequence() {
        var rotation = BigInt(prime)
        var allPrime = true
        for _ in 0..<(rotation.digits.count - 1) {
            rotation = rotation.rotateBy(1)
            if !sieve[rotation.intValue] {
                allPrime = false
                break
            }
        }

        if allPrime {
            ++resultCount
        }
    }

    return resultCount
}
