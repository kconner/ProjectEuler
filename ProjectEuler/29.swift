//
//  29.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/13/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

private func insertUnique<T: Comparable>(#item: T, inout intoList list: [T], var inRange range: Range<Int>) -> Int {
    while range.startIndex < range.endIndex {
        let index = range.startIndex + (range.endIndex - range.startIndex) / 2
        let itemAtIndex = list[index]

        if itemAtIndex < item {
            range.startIndex = index + 1
        } else if item < itemAtIndex {
            range.endIndex = index
        } else {
            return index
        }
    }

    let index = range.startIndex
    list.insert(item, atIndex: index)
    return index
}

func p29() -> Int {
    var sortedValues: [BigInt] = []

    for a in 2...100 {
        var aRaisedToB = BigInt(a)
        var range = sortedValues.startIndex..<sortedValues.endIndex

        for b in 2...100 {
            aRaisedToB = aRaisedToB.multipliedBy(a)
            let index = insertUnique(item: aRaisedToB, intoList: &sortedValues, inRange: range)
            range = index..<sortedValues.endIndex
        }
    }

    return sortedValues.count
}
