//
//  ResultViewIntroText.swift
//  World Quiz
//
//  Created by Daniel Ziems on 7/31/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//

import Foundation

struct ResultViewIntroText {
    var pageNumber = 0
    let firstPage : [String] = [
        """
        You aligned most closely with one species over the rest. Which could it be? Reveal who you are below, then press Continue to understand your stats, share results with friends, and more!
        """,
        """
        You aligned most closely to two species over any others. I wonder which? A tough choice it will be, regardless. Reveal them now!
        """,
        """
        You aligned closely to more than one species--3 in fact. How well-rounded, you are! You may now reveal them below.
        """
    ]
    //first "" is so the first page can be counted as it normally would if all pages were included into a single array
    let remainingPages : [String] = [
        "",
        """
        Now, make a choice! If you need more species information, you may refer back to the World and Species scroll.
        """,
        """
        Once you have chosen, press Continue to understand your stats, share results with friends, and more!
        """
    ]
}
