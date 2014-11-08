//
//  9.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p9() -> Int {

    let targetSum = 1000
    var singletonRange = 1...targetSum

    for var a = singletonRange.endIndex - 2; singletonRange.startIndex <= a; --a {
        let aSquared = a * a
        for b in (a + 1)..<singletonRange.endIndex {
            let bSquared = b * b
            let cSquared = aSquared + bSquared

            let c = targetSum - a - b
            // println("\(aSquared) + \(bSquared) = \(cSquared) … \(a)^2 + \(b)^2 = \(c)^2? … \(c)^2 = \(cSquared)?")
            if c * c == cSquared {
                return a * b * c
            }
        }
    }

    return -1
}
