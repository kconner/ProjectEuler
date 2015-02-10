//
//  22.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/9/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

import Foundation

private func parseNames(string: String) -> [String] {
    return string.componentsSeparatedByString(",").map {
        $0.componentsSeparatedByString("\"")[1]
    }
}

private func letterValueForName(name: String) -> Int {
    let basis = Int(UnicodeScalar("A").value) - 1
    var sum = 0
    for scalar in name.unicodeScalars {
        sum += Int(scalar.value) - basis
    }
    return Int(sum)
}

func p22() -> Int {
    if let path = NSBundle.mainBundle().pathForResource("names", ofType: "txt") {
        if let string = NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil) {
            let sortedNames = parseNames(string as String).sorted(<)
            var index = 1
            return sortedNames.map { letterValueForName($0) * index++ }.reduce(0, combine: +)
        }
    }

    return -1
}
