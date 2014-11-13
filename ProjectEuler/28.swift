//
//  28.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/13/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p28() -> Int {
    // 7x7 spiral:
    // +1
    // +2 +2 +2 +2
    // +4 +4 +4 +4
    // +6 +6 +6 +6

    let width = 1001

    var sum = 1 // center
    var number = 1
    for cycle in 1 ... (width - 1) / 2 {
        let increment = cycle * 2
        for i in 0..<4 {
            number += increment
            sum += number
        }
    }

    return sum
}
