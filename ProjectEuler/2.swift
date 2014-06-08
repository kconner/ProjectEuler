//
//  2.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 6/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p2() -> Int {
    var sum = 0
    
    struct FibState {
        let a, b, sum: Int
        
        func next() -> FibState {
            return FibState(
                a: self.b,
                b: self.sum,
                sum: self.sum + self.b)
        }
    }
    
    var state = FibState(a: 1, b: 1, sum: 2)
    while state.sum <= 4_000_000 {
        sum += state.sum
        
        // Every third Fibonacci number is even; it's the sum of two odds
        state = state.next().next().next()
    }
    
    return sum
}
