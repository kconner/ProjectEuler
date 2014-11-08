//
//  5.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 6/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

import Foundation

func p5() -> Int {
    struct PrimeFactor {
        let prime: Int
        var power: Int
    }
    
    let primes = [2, 3, 5, 7, 11, 13, 17, 19]
    var powers = [0, 0, 0, 0, 0, 0, 0, 0]
    
    for value in 2...20 {
        for index in primes.startIndex..<primes.endIndex {
            let prime = primes[index]
            var dividend = value
            var power = 0
            while dividend % prime == 0 {
                dividend /= prime
                ++power
            }
            powers[index] = max(powers[index], power)
        }
    }
    
    return reduce(Zip2(primes, powers), 1, { product, factor in
        return product * Int(pow(CDouble(factor.0), CDouble(factor.1)))
    })
}
