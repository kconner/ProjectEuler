//
//  4.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 6/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

import Foundation

func p4() -> Int {
    let range = 100...999
    
    var seed = range.endIndex
    
    let palindromeGenerator = GeneratorOf<Int> {
        if seed < range.startIndex {
            return nil
        }
        
        let ones = seed % 10
        let tens = (seed - ones) % 100
        let hundreds = (seed - tens - ones) % 1000
        
        let result = hundreds / 100
                   + tens
                   + ones * 100
                   + seed * 1000
        
        seed--
        
        return result
    }
    
    for palindrome in palindromeGenerator {
        let lower: Int = min(palindrome / 999, 999)
        let upper: Int = Int(sqrt(CDouble(palindrome)))
        
        for divisor in lower..<upper {
            if palindrome % divisor == 0 {
                let quotient = palindrome / divisor
                if range.startIndex <= quotient && quotient <= range.endIndex {
                    return palindrome
                }
            }
        }
    }
    
    return 0

}
