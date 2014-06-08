//
//  3.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 6/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p3() -> Int {
    var dividend = 600851475143
    
    var primes: Int[] = []
    
    func isPrime(value: Int) -> Bool {
        for prime in primes {
            if value % prime == 0 {
                return false
            }
        }
        return true
    }
    
    var divisor = 2
    while (divisor * divisor < dividend) {
        while (dividend % divisor == 0) {
            if (isPrime(divisor)) {
                primes.append(divisor)
                dividend /= divisor
            }
        }
        divisor++
    }
    
    return dividend
}
