//
//  6.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 6/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p6() -> Int {
    let range = 1...100
    let sum = reduce(range, 0, +)
    let squareOfSum = sum * sum
    let sumOfSquares = reduce(range, 0) { sum, value in sum + value * value }
    return squareOfSum - sumOfSquares
}
