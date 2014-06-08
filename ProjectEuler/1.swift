//
//  1.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 6/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

func p1() -> Int {
    // slow, even though filter is a lazily evaluated collection?
    // return reduce(filter(3...999, { $0 % 3 == 0 || $0 % 5 == 0 }), 0, +)
    
    // uglier, but faster
    return reduce(3...999, 0, { (sum: Int, value: Int) -> Int in
        if value % 3 == 0 || value % 5 == 0 {
            return sum + value
        }
        else {
            return sum
        }
    })
}
