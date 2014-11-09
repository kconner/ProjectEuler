//
//  BigDecimal.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

struct BigDecimal: Printable {
    let digits: [Int] // [0] = ones, [1] = tens…

    var intValue: Int {
        var sum = 0, place = 1
        for digit in digits {
            sum += digit * place
            place *= 10
        }
        return sum
    }

    var description: String {
        var string = ""
        for digit in digits.reverse() {
            string.extend(String(digit))
        }
        return string
    }

    init(var _ amount: Int) {
        var digits: [Int] = []

        while amount != 0 {
            let digit = amount % 10
            digits.append(digit)
            amount /= 10
        }

        self.digits = digits
    }

    private init(digits: [Int]) {
        self.digits = digits
    }

    func multipliedBy(factor: Int) -> BigDecimal {
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

        return BigDecimal(digits: digits)
    }
}
