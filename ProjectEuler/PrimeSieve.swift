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
                for multiple in stride(from: highestChecked * 2, to: entries.count, by: highestChecked) {
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

// MARK: Iterable sequence of primes

extension PrimeSieve {
    struct PrimeGenerator : GeneratorType {
        let sieve: PrimeSieve
        var lastPrime: Int

        init(sieve: PrimeSieve) {
            self.sieve = sieve
            self.lastPrime = 1
        }

        mutating func next() -> Int? {
            if let nextPrime = sieve.nextPrimeAfter(lastPrime) {
                lastPrime = nextPrime
                return lastPrime
            } else {
                return nil
            }
        }
    }

    struct PrimeSequence : SequenceType {
        let sieve: PrimeSieve

        func generate() -> PrimeGenerator {
            return PrimeGenerator(sieve: sieve)
        }
    }

    func primeSequence() -> PrimeSequence {
        return PrimeSequence(sieve: self)
    }
}
