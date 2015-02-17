//
//  Digits.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 2/17/15.
//  Copyright (c) 2015 Kevin Conner. All rights reserved.
//

class Digits : Printable, Comparable {
    class func findDigits(var amount: Int, base: Int) -> [Int] {
        var digits: [Int] = []

        while amount != 0 {
            let digit = amount % base
            digits.append(digit)
            amount /= base
        }

        return digits
    }

    let base: Int
    let digits: [Int] // [0] = least significant, [1] = next least significant…

    init(base: Int, digits: [Int]) {
        self.base = base
        self.digits = digits
    }

    init(base: Int, amount: Int) {
        self.base = base
        self.digits = Digits.findDigits(amount, base: base)
    }

    subscript(index: Int) -> Int {
        if index < digits.count {
            return digits[index]
        } else {
            return 0
        }
    }

    var intValue: Int {
        var sum = 0, place = 1
        for digit in digits {
            sum += digit * place
            place *= base
        }
        return sum
    }

    var description: String {
        var string = String()
        for digit in digits.reverse() {
            string.extend(String(digit))
        }
        return string
    }
}

// MARK: Equatable

func ==(x: Digits, y: Digits) -> Bool {
    return x.digits == y.digits
}

// MARK: Comparable

func <(x: Digits, y: Digits) -> Bool {
    return x.intValue < y.intValue
}
