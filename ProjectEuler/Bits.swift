//
//  Bits.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 2/17/15.
//  Copyright (c) 2015 Kevin Conner. All rights reserved.
//

struct Bits: Printable, Comparable {
    let bits: [Bool] // [0] = ones, [1] = twos…

    init(var _ amount: Int) {
        var bits: [Bool] = []

        while amount != 0 {
            let bit = amount & 0x01 != 0
            bits.append(bit)
            amount >>= 1
        }
        
        self.bits = bits
    }

    init(bits: [Bool]) {
        self.bits = bits
    }

    subscript(index: Int) -> Bool {
        if index < bits.count {
            return bits[index]
        } else {
            return false
        }
    }

    var intValue: Int {
        var sum = 0, placeValue = 1
        for bit in bits {
            if bit {
                sum += placeValue
            }
            placeValue <<= 1
        }
        return sum
    }

    var description: String {
        var string = String()
        for bit in bits.reverse() {
            string.extend(bit ? "1" : "0")
        }
        return string
    }

    func reverse() -> Bits {
        return Bits(bits: bits.reverse())
    }
}

// MARK: Comparable

func ==(x: Bits, y: Bits) -> Bool {
    return x.bits == y.bits
}

func <(x: Bits, y: Bits) -> Bool {
    return x.intValue < y.intValue
}
