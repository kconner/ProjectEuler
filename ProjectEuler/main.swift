//
//  main.swift
//  ProjectEuler
//
//  Created by Kevin Conner on 6/8/14.
//  Copyright (c) 2014 Kevin Conner. All rights reserved.
//

// http://projecteuler.net/problem=1 etc.

import Cocoa

let problems = [
    p1, p2, p3, p4, p5, p6, p7, p8, p9, p10,
    p11, p12, p13, p14, p15, p16, p17, p18, p19, p20,
    p21, p22, p23, p24, p25, p26, p27]

var problemNumber = problems.count

for problem in problems.reverse() {
    let dateBefore = NSDate()
    let result = problem()
    let duration = NSDate().timeIntervalSinceDate(dateBefore)
    
    println("\(problemNumber). \(result), \(duration) seconds")
    problemNumber--
}
