//
//  InfoSheet.swift
//  World Quiz
//
//  Created by Daniel Ziems on 7/26/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//

import Foundation

struct InfoScroll {
    let pages : [String]
    let pageTitle : [String]
    
    init(pTs: [String], pgs: [String]) {
        pageTitle = pTs
        pages = pgs
    }
}
