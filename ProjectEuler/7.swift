//
//  7.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 6/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p7() -> Int {
    let targetPrimeCount = 10001
    let numbersToConsider = 1 << 17
    
    var isPrime: [Bool] = []
    isPrime.extend(Repeat(count: numbersToConsider, repeatedValue: true))
    
    var primeCount = 1
    
    var value = 3
    while value < numbersToConsider {
        if isPrime[value] {
            ++primeCount
            if primeCount == targetPrimeCount {
                return value
            }
            
            var multiple = value + value
            while multiple < numbersToConsider {
                isPrime[multiple] = false
                multiple += value
            }
        }
        
        value += 2
    }
    
    return 0
}
