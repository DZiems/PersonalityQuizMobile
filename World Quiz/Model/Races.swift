//
//  Races.swift
//  Fantasy World Quiz
//
//  Created by Daniel Ziems on 7/20/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//

import Foundation

struct Races {
    //the following are a userCharacter's likenesses to the 6 potential alignments - arithmetic (50%), geometric (50%), and combined (100% = arit + geom)
    //these will be generated on the ResultViewController page
    var aritLs : [Float] = []
    var geomLs : [Float] = []
    var combLs : [Float] = []
    var top3 : [Int] = []
    
//    let droobIdentifier = 0
//    let skloonIdentifier = 1
//    let garoofIdentifier = 2
//    let hglurIdentifier = 3
//    let westfnrIdentifier = 4
//    let eastfnrIdentifier = 5
    
    //the races:
    let races : [Character] = [
        Character(
            n: "Droob'n'st",
            ma: [
                50, //intellect
                28, //spirit
                22, //sociability
                33  //physicality/athleticism
            ],
            sa: [
                5, 24, 21, //INT: creativity, wisdom, analytics
                8, 6, 14,  //SPI: empathy, resilience, decisivenes
                9, 5, 8,   //SOC: expressiveness, cooperativeness,
                7, 15, 11  //ATH: swiftness, coordination, strengt
            ]
        ),
        Character(
            n: "Skloon'st",
            ma: [
                42, //intellect
                34, //spirit
                24, //sociability
                33  //physicality/athleticism
            ],
            sa: [
                16, 10, 16, //INT: creativity, wisdom, analytics
                9, 14, 11,  //SPI: empathy, resilience, decisivenes
                9, 9, 5,    //SOC: expressiveness, cooperativeness,
                10, 15, 8   //ATH: swiftness, coordination, strengt
            ]
        ),
        Character(
            n: "Garoof'ibn'st",
            ma: [
                28, //intellect
                43, //spirit
                29, //sociability
                33  //physicality/athleticism
            ],
            sa: [
                10, 9, 9,  //INT: creativity, wisdom, analytics
                19, 13, 1, //SPI: empathy, resilience, decisivenes1,
                14, 7, 8,  //SOC: expressiveness, cooperativeness,
                18, 10, 5  //ATH: swiftness, coordination, strengt
            ]
        ),
        Character(
            n: "H'glur'boon'st",
            ma: [
                24, //intellect
                36, //spirit
                40, //sociability
                33  //physicality/athleticism
            ],
            sa: [
                8, 13, 3,  //INT: creativity, wisdom, analytics
                14, 16, 6, //SPI: empathy, resilience, decisivenes,
                10, 15, 1, //SOC: expressiveness, cooperativeness,5,
                4, 10, 19  //ATH: swiftness, coordination, strengt
            ]
        ),
        Character(
            n: "Western Fn'r'noot'st",
            ma: [
                42, //intellect
                35, //spirit
                23, //sociability
                33  //physicality/athleticism
            ],
            sa: [
                10, 14, 18, //INT: creativity, wisdom, analytics
                9, 12, 14,  //SPI: empathy, resilience, decisivenes
                9, 8, 6,    //SOC: expressiveness, cooperativeness,
                12, 11, 10  //ATH: swiftness, coordination, strengt
            ]
        ),
        Character(
            n: "Eastern Fn'r'noot'st",
            ma: [
                45, //intellect
                40, //spirit
                15, //sociability
                33  //physicality/athleticism
            ],
            sa: [
                14, 8, 20, //INT: creativity, wisdom, analytics
                5, 20, 15, //SPI: empathy, resilience, decisiveness
                8, 5, 2,   //SOC: expressiveness, cooperativeness, friendliness
                10, 8, 15  //ATH: swiftness, coordination, strength
            ]
        )
    ]
    
    
    //50% of alignment: compare sub-attribute stat numbers
    //influence of athletics is weighted less than other stats
    //if within x amount, give full points; if within y amount, give 75%; if within w amount, 50%; etc..
    //max score: 10 (100% alike)
    mutating func generateArithmeticLikenesses(user: Character) {
        if aritLs.count == 0 {
            aritLs = [Float](repeating: 0.0, count: races.count)
            let tier1Range : Float = 4
            
            if user.hasSAPoints {
                for i in 0..<user.subAttributes.count {
                    for r in 0..<races.count {
                        let difference = abs(user.subAttributes[i] - races[r].subAttributes[i])
                        let userMAP = user.mainAttributes[(i / 3)]
                        //if your MAP is 50, then ranges are 4; if your MAP is 15, ranges are 2
                        let rangeMultiplier = 1 - (Float(user.mainAttrLimit - userMAP) / (2 * Float(user.mainAttrLimit - user.mainAttrMin)))
                        //if not athletics:
                        if (i / 3) != 3 {
                            if difference < tier1Range * rangeMultiplier {
                                aritLs[r] += 1
                            }
                            else if difference < 2 * tier1Range * rangeMultiplier {
                                aritLs[r] += 0.5
                            }
                            else if difference < 3 * tier1Range * rangeMultiplier {
                                aritLs[r] += 0.25
                            }
                            else if difference < 4 * tier1Range * rangeMultiplier {
                                aritLs[r] += 0.125
                            }
                        }
                        //if athletics:
                        else {
                            if difference < tier1Range * rangeMultiplier {
                                aritLs[r] += 0.33333
                            }
                            else if difference < 2 * tier1Range * rangeMultiplier {
                                aritLs[r] += 0.16667
                            }
                            else if difference < 3 * tier1Range * rangeMultiplier {
                                aritLs[r] += 0.08333
                            }
                            else if difference < 4 * tier1Range * rangeMultiplier {
                                aritLs[r] += 0.04167
                            }
                        }
                    }
                }
                print ("\(user.name)'s arithmetic likenesses: \(aritLs)")
            }
        }
        else {
            print("arithmeticLikenesses() call denied for \(user.name), stats have not been aligned!")
        }
    }
    
    //50% of alignment: compare ratios between sub-attributes
    //influence of athletics is weighted less than other stats
    mutating func generateGeometricLikenesses(user: Character) {
        if geomLs.count == 0 {
            geomLs = [Float](repeating: 0.0, count: races.count)
            let tier1Range : Float = 0.075
            if user.hasSARatios {
                for i in 0..<user.subAttrRatios.count {
                    for r in 0..<races.count {
                        let difference = abs(user.subAttrRatios[i] - races[r].subAttrRatios[i])
                        if (i / 3) != 3 {
                            if difference < tier1Range {
                                geomLs[r] += 1
                            }
                            else if difference < 2 * tier1Range {
                                geomLs[r] += 0.5
                            }
                            else if difference < 3 * tier1Range {
                                geomLs[r] += 0.25
                            }
                            else if difference < 4 * tier1Range {
                                geomLs[r] += 0.125
                            }
                        }
                        else {
                            if difference < tier1Range {
                                geomLs[r] += 0.33333
                            }
                            else if difference < 2 * tier1Range {
                                geomLs[r] += 0.16667
                            }
                            else if difference < 3 * tier1Range {
                                geomLs[r] += 0.08333
                            }
                            else if difference < 4 * tier1Range {
                                geomLs[r] += 0.04167
                            }
                        }
                    }
                }
                print ("\(user.name)'s geometric likenesses: \(geomLs)")
            }
        }
        else {
            print("geometricLikenesses() call denied for \(user.name), stats have not been aligned!")
        }
    }
    
    mutating func generateCombinedLikenesses(user: Character)  {
        if combLs.count == 0 {
            combLs = [Float](repeating: 0.0, count: races.count)
            let geomMultiplier : Float = 0.5
            let aritMultiplier : Float = 1 - geomMultiplier
            
            if user.hasSAPoints && user.hasSARatios {
                for i in 0..<combLs.count {
                    combLs[i] += (geomMultiplier * geomLs[i]) + (aritMultiplier * aritLs[i])
                }
            }
            else {
                print("combinedLikenesses() call denied for \(user.name), stats not been aligned!")
            }
        }
        else {
            print("combinedLikenesses() call denied for \(user.name), this has already been called!")
        }
    }
    
    mutating func generateTopThree(user: Character) {
        if combLs.count > 0 {
            let rangeWithinTop : Float = 1.0 //effectively, 1.0 is 10% likeness because likeness to each race is a score out of 10
            
            var first : Float = 0
            var firstRace : Int = -1
            var second : Float = 0
            var secondRace : Int = -1
            var third : Float = 0
            var thirdRace : Int = -1
            
            for i in 0..<combLs.count {
                if first < combLs[i] {
                    first = combLs[i]
                    firstRace = i
                }
            }
            top3.append(firstRace)
            for i in 0..<combLs.count {
                if second < combLs[i] && i != firstRace {
                    second = combLs[i]
                    secondRace = i
                }
            }
            if first - second <= rangeWithinTop {
                top3.append(secondRace)
                for i in 0..<combLs.count {
                    if third < combLs[i] && (i != firstRace && i != secondRace) {
                        third = combLs[i]
                        thirdRace = i
                    }
                }
                if first - third <= rangeWithinTop {
                    top3.append(thirdRace)
                }
            }
        }
        else {
            print("generateTopThree() call denied for \(user.name), likenesses not yet calculated!")
        }
    }
    
    mutating func calculateAlignmentResults(user: Character) {
        generateArithmeticLikenesses(user: user)
        generateGeometricLikenesses(user: user)
        generateCombinedLikenesses(user: user)
        generateTopThree(user: user)
        print("\(user.name)'s Combined Likenesses: \(combLs)")
        print("\(user.name)'s Top 3: \(top3)")
        
    }
    
    
    
}
