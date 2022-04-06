//
//  Question.swift
//  Fantasy World Quiz
//
//  Created by Daniel Ziems on 7/19/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//

import Foundation

struct Question {
    //3-question or 6-question
    let type : Int
    //question itself
    let query : String
    //stats to increase
    let statsUp : [[String:Float]]
    
    init(t: Int, q: String, s: [[String:Float]]) {
        type = t
        query = q
        statsUp = s
    }
}
