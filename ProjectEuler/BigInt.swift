//
//  BigInt.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

class BigInt: Digits, Comparable {
    init(_ amount: Int) {
        super.init(base: 10, amount: amount)
    }

    init(digits: [Int]) {
        super.init(base: 10, digits: digits)
    }

    var ones: Int {
        return self[0]
    }

    var tens: Int {
        return self[1]
    }

    var hundreds: Int {
        return self[2]
    }

    var thousands: Int {
        return self[3]
    }

    func reverse() -> BigInt {
        return BigInt(digits: digits.reverse())
    }

    func addedTo(other: BigInt) -> BigInt {
        var longer = self.digits
        var shorter = other.digits
        if (longer.count < shorter.count) {
            (longer, shorter) = (shorter, longer)
        }

        var digits: [Int] = []

        var carry = 0
        for i in shorter.startIndex..<shorter.endIndex {
            var value = longer[i] + shorter[i] + carry
            digits.append(value % 10)
            carry = value / 10
        }

        for i in shorter.endIndex..<longer.endIndex {
            var value = longer[i] + carry
            digits.append(value % 10)
            carry = value / 10
        }

        while carry != 0 {
            digits.append(carry % 10)
            carry /= 10
        }

        return BigInt(digits: digits)
    }

    func multipliedBy(factor: Int) -> BigInt {
        var digits = self.digits

        var carry = 0
        for var i = digits.startIndex; i < digits.endIndex; ++i {
            let value = digits[i] * factor + carry
            digits[i] = value % 10
            carry = value / 10
        }

        while carry != 0 {
            digits.append(carry % 10)
            carry /= 10
        }

        return BigInt(digits: digits)
    }

    func rotateBy(steps: Int) -> BigInt {
        var rotatedDigits = digits
        for _ in 0..<steps {
            rotatedDigits.insert(rotatedDigits.removeLast(), atIndex: 0)
        }
        return BigInt(digits: rotatedDigits)
    }
}

// MARK: Equatable

func ==(x: BigInt, y: BigInt) -> Bool {
    return (x as Digits) == (y as Digits)
}

// MARK: Comparable

func <(x: BigInt, y: BigInt) -> Bool {
    var xDigits = x.digits
    var yDigits = y.digits
    let xOrder = xDigits.count, yOrder = yDigits.count

    if xOrder < yOrder {
        return true
    } else if yOrder < xOrder {
        return false
    } else {
        do {
            let (a, b) = (xDigits.removeLast(), yDigits.removeLast())
            if a < b {
                return true
            } else if b < a {
                return false
            }
        } while 0 < xDigits.count
    }

    return false
}
