//
//  EntryViewIntroductionText.swift
//  World Quiz
//
//  Created by Daniel Ziems on 7/23/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//

import Foundation

class EntryViewIntroductionText {
    var currentPage = 0
    let scrollOfferPage = 3
    let pages : [String] = [
        """
        Welcome to a very special quiz. Please be seated, or otherwise properly relaxed, and enjoy the nice ambiance of this plain text staring back at you.
        """,
        """
        This quiz introduces you to a new world: one in which five entirely different species each have managed and cultivated their own cultures, values, specialties, and hardships.
        """,
        """
        Ultimately, this quiz intends to align you with one of these species so that you too may feel a part of this fantastical world.
        """,
        """
        You may become more acquainted with the World and Species by studying the provided scroll. Choose a chapter to read a species's detailed history. This can't be accessed again until you finish.
        """,
        """
        Please note: As difficult as any question may be, you must choose the option which MOST accurately aligns with you (or otherwise the character you wish to create).
        """,
        """
        Lastly, there will be two parts. In the first, you must answer questions to determine who you are, and in the second you must introspect and judge your own aptitudes.
        """,
        """
        More explanation will be provided as necessary. Get ready to learn a little more about yourself! Press Begin Quiz when you are ready, and have fun.
        """
    ]
}
