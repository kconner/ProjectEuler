//
//  31.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/13/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

private func coinCombinationCount(total: Int, values: Slice<Int>) -> Int {
    if values.count == 1 {
        return 1 // the one penny coin can always make the remainder one way.
    }

    var sum = 0
    var value = 0
    while value < total {
        let sublist = values[1..<values.count]
        let combinations = coinCombinationCount(total - value, sublist)
        sum += combinations
        value += values[0]
    }

    if value == total {
        ++sum
    }
    
    return sum
}

func p31() -> Int {
    return coinCombinationCount(200, [200, 100, 50, 20, 10, 5, 2, 1])
}
