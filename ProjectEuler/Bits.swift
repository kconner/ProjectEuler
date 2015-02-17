//
//  Bits.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 2/17/15.
//  Copyright (c) 2015 Kevin Conner. All rights reserved.
//

class Bits: Digits {
    init(var _ amount: Int) {
        var digits: [Int] = []

        while amount != 0 {
            let digit = amount & 0x01
            digits.append(digit)
            amount >>= 1
        }

        super.init(base: 2, digits: digits)
    }

    init(digits: [Int]) {
        super.init(base: 2, digits: digits)
    }

    func reverse() -> Bits {
        return Bits(digits: digits.reverse())
    }
}
