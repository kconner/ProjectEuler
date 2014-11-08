//
//  10.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p10() -> Int {
    let limit = 2_000_000
    var sieve = Array<Bool>(count: limit, repeatedValue: true)

    var sum = 0
    for i in 2..<limit {
        if sieve[i] {
            // Oh man it's a prime.
            sum += i
            
            for var multiple = i + i; multiple < limit; multiple += i {
                sieve[multiple] = false
            }
        }
    }
    
    return sum
}
