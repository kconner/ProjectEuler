//
//  14.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p14() -> Int {
    let limit = 1_000_000
    let unknownSentinel = -1

    var knownCounts: [Int] = Array<Int>(count: limit, repeatedValue: unknownSentinel)
    var longest = (number: 1, count: 1)

    for start in 2..<limit {
        var term = start
        var count = 1

        for term = start; term != 1; ++count {
            if term < knownCounts.endIndex {
                let knownCount = knownCounts[term]
                if knownCount != unknownSentinel {
                    count += knownCount - 1
                    break
                }
            }

            if term % 2 == 0 {
                term >>= 1
            }
            else {
                term = 3 * term + 1
            }
        }

        knownCounts[start] = count

        if longest.count < count {
            longest = (number: start, count: count)
        }
    }

    return longest.number
}
