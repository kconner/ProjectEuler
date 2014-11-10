//
//  15.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

private let sieve = PrimeSieve(max: 40)

private func primeFactorsOf(var value: Int) -> [Int] {
    var primeFactors: [Int] = []

    for var prime = sieve.firstPrime; prime <= value; {
        while value % prime == 0 {
            primeFactors.append(prime)
            value /= prime
        }

        if let nextPrime = sieve.nextPrimeAfter(prime) {
            prime = nextPrime
        } else {
            break
        }
    }

    return primeFactors
}

class Factorization {
    var factors: [Int]
    lazy var primeFactors: [Int] = { [unowned self] in
        var primes: [Int] = []
        self.factors.map { extend(&primes, primeFactorsOf($0)) }
        return primes
    }()

    init(_ factors: [Int]) {
        self.factors = factors
    }

    init(factorialOfDegree degree: Int) {
        self.factors = (2...degree).map { $0 }
    }

    var value: Int {
        return factors.reduce(1, combine: *)
    }
}

func / (a: Factorization, b: Factorization) -> Factorization {
    var reducedFactors = a.primeFactors
    var divisorFactors = b.primeFactors

    for divisor in divisorFactors {
        for var i = reducedFactors.startIndex; i < reducedFactors.endIndex; ++i {
            let dividend = reducedFactors[i]
            if dividend == divisor {
                reducedFactors.removeAtIndex(i)
                break
            }
        }
    }

    return Factorization(reducedFactors)
}

func p15() -> Int {
    // How many 2n-bit numbers exist with n 0s and n 1s?
    // How many permutations of n 0s and n 1s exist?
    // If A out of N items are identical, then the number of different permutations of the N items is N! / A!
    // If a set of N items contains A identical items and B identical items, then the total number of different permutations of N objects is N! / (A! * B!)
    // 40! / 20! / 20! is not doable in regular Ints, so I store the terms as prime factorizations instead.

    let aBang = Factorization(factorialOfDegree: 20)
    let nBang = Factorization(factorialOfDegree: 40)
    return (nBang / aBang / aBang).value
}
