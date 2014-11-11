//
//  25.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/9/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p25() -> Int {
    var terms = (
        previous: BigInt(1),
        current: BigInt(1),
        index: 2)

    while terms.current.digits.count < 1000 {
        terms = (
            terms.current,
            terms.current.addedTo(terms.previous),
            ++terms.index)
    }

    return terms.index
}
