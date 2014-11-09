//
//  19.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 11/9/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

// Month is one-based.
func daysInMonth(month: Int, ofYear year: Int) -> Int {
    switch month {
    case 1, 3, 5, 7, 8, 10, 12:
        return 31
    case 4, 6, 9, 11:
        return 30
    case 2:
        return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) ? 29 : 28
    default:
        return 0
    }
}

func p19() -> Int {
    var sundayFirstOfMonthCount = 0

    var dayOfWeek = 1 // 0 is sunday, 6 is saturday. Jan 1, 1900 was a Monday.
    for year in 1900...2000 {
        for month in 1...12 {
            if dayOfWeek == 0 && 1901 <= year {
                ++sundayFirstOfMonthCount
            }

            dayOfWeek = (dayOfWeek + daysInMonth(month, ofYear: year)) % 7
        }
    }

    return sundayFirstOfMonthCount
}
