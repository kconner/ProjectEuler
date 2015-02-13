//
//  32.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 2/11/15.
//  Copyright (c) 2015 Kevin Conner. All rights reserved.
//

private extension Array {
    func objectsAtBitmaskIndexes(bitmask: Int) -> [Element] {
        var result: [Element] = []

        var remainingBits = bitmask;
        var index = 0;
        while 0 < remainingBits {
            if remainingBits & 1 != 0 {
                result.append(self[index])
            }

            remainingBits >>= 1
            ++index
        }

        return result
    }

    func allPermutations() -> [[Element]] {
        if self.count <= 1 {
            return [self]
        } else {
            // TODO: should be able to do this in a more functional style
            var result: [[Element]] = []
            for (index, item) in enumerate(self) {
                var rest = Array(self)
                rest.removeAtIndex(index)

                var permutations = rest.allPermutations()
                result.extend(permutations.map { (var permutation) in
                    permutation.append(item)
                    return permutation
                })
            }
            return result
        }
    }
}

private func eachPermutation(digits: [Int], action: (permutation: [Int]) -> Void) {
    // There are usedDigits.count! permutations of usedDigits. Iterate through them all.
    for permutation in digits.allPermutations() {
        action(permutation: permutation)
    }
}

private func eachCombination(digits: [Int], action: (usedDigits: [Int], unusedDigits: [Int]) -> Void) {
    // Find every unique combination of digits that leaves at least one digit unused.
    // So, include or don't include every digit with every other digit.
    // Iterate through bitmasks covering all the possibilities.
    // 1 to 2^n-2, not 0 to 2^n-1, because we don't want usedDigits nor unusedDigits to be empty.
    let bitmaskLimit = 1 << digits.count - 1
    for bitmask in 1..<bitmaskLimit {
        action(usedDigits: digits.objectsAtBitmaskIndexes(bitmask), unusedDigits: digits.objectsAtBitmaskIndexes(bitmask ^ bitmaskLimit))
    }
}

private func intFromDigits(digits: [Int]) -> Int {
    var sum = 0
    for digit in digits {
        sum *= 10
        sum += digit
    }
    return sum
}

private func unorderedDigitsFromInt(var value: Int) -> [Int] {
    var digits: [Int] = []
    while 0 < value {
        digits.append(value % 10)
        value /= 10
    }
    return digits
}

func p32() -> Int {
    let maximumFactor1DigitCount = 2
    let minimumProductDigitCount = 4 // x * yyyy = zzzz
    let maximumProductDigitCount = 4 // xxx * yy = zzzzz

    let allDigits = Array(1...9)
    var products: Set<Int> = Set()
    
    // For all possible first factors,
    eachCombination(allDigits) { factor1Digits, unusedDigits in
        if factor1Digits.count <= maximumFactor1DigitCount {
            eachPermutation(factor1Digits) { permutation1 in
                let factor1 = intFromDigits(permutation1)
                
                // And all possible second factors given the first,
                eachCombination(unusedDigits) { factor2Digits, expectedProductDigits in
                    if (minimumProductDigitCount <= expectedProductDigits.count && expectedProductDigits.count <= maximumProductDigitCount) {
                        eachPermutation(factor2Digits) { permutation2 in
                            let factor2 = intFromDigits(permutation2)
                            let expectedProductDigitSet = Set(expectedProductDigits)
                            
                            // If the product's digits are a permutation of the remaining digits, count it.
                            let product = factor1 * factor2
                            let productDigits = unorderedDigitsFromInt(product)
                            if productDigits.count == expectedProductDigitSet.count && Set(productDigits) == expectedProductDigitSet {
                                // println(String(format: "%d * %d = %d", factor1, factor2, product))
                                products.insert(product)
                            }
                        }
                    }
                }
            }
        }
    }

    return reduce(products, 0, +)
}
