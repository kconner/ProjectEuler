//
//  PrimeSieve.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

class PrimeSieve {
    private var entries: [Bool] // false if known not to be prime
    private var highestChecked = 1
    let firstPrime = 2

    init(max: Int) {
        entries = Array<Bool>(count: max + 1, repeatedValue: true)
    }

    private func checkUpTo(limit: Int) {
        while highestChecked < limit {
            ++highestChecked
            if entries[highestChecked] {
                for var multiple = highestChecked * 2; multiple < entries.count; multiple += highestChecked {
                    entries[multiple] = false
                }
            }
        }
    }

    subscript(natural: Int) -> Bool {
        if natural < firstPrime {
            return false
        }

        checkUpTo(natural - 1)
        return entries[natural]
    }

    func nextPrimeAfter(var natural: Int) -> Int? {
        while ++natural < entries.count {
            if self[natural] {
                return natural
            }
        }

        return nil
    }
}
