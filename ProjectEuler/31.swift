//
//  31.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/13/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

private func coinCombinationCount(total: Int, values: Slice<Int>) -> Int {
    if total < 0 {
        return 0
    } else if total == 0 || values.count == 1 {
        return 1 // the one penny coin can always make the remainder one way.
    } else {
        let head = values[0]
        let tail = values[1..<values.count]

        return (0 ... total / head).map {
            coinCombinationCount(total - head * $0, tail)
        }.reduce(0, +)
    }
}

func p31() -> Int {
    return coinCombinationCount(200, [200, 100, 50, 20, 10, 5, 2, 1])
}
