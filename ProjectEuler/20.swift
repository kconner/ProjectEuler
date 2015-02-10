//
//  20.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/9/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p20() -> Int {
    var decimal = BigInt(1)
    for i in 2...100 {
        decimal = decimal.multipliedBy(i)
    }

    return decimal.digits.reduce(0, combine: +)
}
