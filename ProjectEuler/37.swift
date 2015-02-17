//
//  37.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 2/17/15.
//  Copyright (c) 2015 Kevin Conner. All rights reserved.
//

private let gSieve = PrimeSieve(max: 1_000_000)

private func findPrefixPrimes(producePrime: (Int -> Bool)) {
    // Prefix primes are those whose digit prefixes are all primes.
    // Generate them by starting with known primes and appending digits while they remain prime.
    var queue = [2, 3, 5, 7]
    var primes = Set(queue)

    while 0 < queue.count {
        let prime = queue.removeAtIndex(0)
        let children = [1, 3, 5, 7, 9].map { digit in
            BigInt(digits: [digit, prime]).intValue
        }
        
        for child in children {
            if gSieve[child] && !primes.contains(child) {
                primes.insert(child)
                queue.append(child)

                if !producePrime(child) {
                    return
                }
            }
        }
    }
}

func isSuffixPrime(prime: Int) -> Bool {
    // Suffix primes are those whose digit suffixes are all primes.
    // Verify them by removing initial digits to find each suffix.
    var digits = BigInt(prime).digits
    while 1 < digits.count {
        digits.removeLast()
        let suffix = BigInt(digits: digits).intValue
        if !gSieve[suffix] {
            return false
        }
    }

    return true
}

func p37() -> Int {
    let limit = 11
    var prefixAndSuffixPrimes: [Int] = []

    findPrefixPrimes { prime in
        if isSuffixPrime(prime) {
            println(prime)
            prefixAndSuffixPrimes.append(prime)
            return prefixAndSuffixPrimes.count < limit
        } else {
            return true
        }
    }

    return reduce(prefixAndSuffixPrimes, 0, +)
}
