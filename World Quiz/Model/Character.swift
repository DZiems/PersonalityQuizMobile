//
//  Character.swift
//  Fantasy World Quiz
//
//  Created by Daniel Ziems on 7/20/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//

import Foundation


struct Character {
    //main stats
    var mainAttrPts : Int
    var mainAttributes : [Int]
    var subAttributes : [Float]
    var name : String
    var alignment : String?
    var alignmentInd : Int?
    
    //derived stats
    var subAttrRatios : [Float]
    
    //protectors so certain functions can't be called by accident.
    //helps keep things flexible in case I want to swap the layout of the quiz's different sections
    var hasSARatios : Bool
    var hasSAPoints : Bool
    var hasEatenJuice : Bool
    
    //constants
    let mainAttrLimit = 50
    let mainAttrMin = 15
    
    init() {
        mainAttributes = [15, 15, 15, 33]
        //100 main attribute points will be put into these 3 characterizations.
        //the user will later get an opportunity to add 55 more points to these three.
            //MA 0: intellect
            //MA 1: spirit
            //MA 2: sociability
        //33 more M.A.P.s will be put into athleticism, but unlike the other three MAs, this remains static.
            //MA 3: athleticism
        
        mainAttrPts = 55 //remaining points (100 - (15 + 15 + 15))
        
        subAttributes = [Float](repeating: 0.0, count: 12)
            //SA 0: creative
            //SA 1: philosophical
            //SA 2: analytical
            //SA 3: empathetic
            //SA 4: resilient
            //SA 5: decisive
            //SA 6: expressive
            //SA 7: cooperative
            //SA 8: friendly
            //SA 9: swift
            //SA 10: coordinated
            //SA 11: big
        
        subAttrRatios = subAttributes
        name = "User"
        hasSAPoints = false
        hasSARatios = false
        hasEatenJuice = false
        print("\(name) initialized")
        alignment = nil
        alignmentInd = nil
    }
    
    init(n: String, ma: [Int], sa: [Float]) {
        mainAttrPts = 100 + 33
        mainAttributes = ma
        for i in ma {
            mainAttrPts -= i
        }
        if mainAttrPts != 0 {
            print("mainAttrPts were not spent properly for: \(n), (\(mainAttrPts) mainAttrPts left)")
        }
        if mainAttributes[3] != 33 {
            print("Warning: MA ath is set to \(mainAttributes[3]) for \(n) (should be 33)")
        }
        subAttributes = sa
        name = n
        hasSAPoints = true
        hasSARatios = true
        hasEatenJuice = false
        //generate subAttrRatios (can't call member functions before initialization)
        let intTotal = subAttributes[0] + subAttributes[1] + subAttributes[2]
        let spiTotal = subAttributes[3] + subAttributes[4] + subAttributes[5]
        let socTotal = subAttributes[6] + subAttributes[7] + subAttributes[8]
        let athTotal = subAttributes[9] + subAttributes[10] + subAttributes[11]
        subAttrRatios = [
            (subAttributes[0] / intTotal),
            (subAttributes[1] / intTotal),
            (subAttributes[2] / intTotal),
            (subAttributes[3] / spiTotal),
            (subAttributes[4] / spiTotal),
            (subAttributes[5] / spiTotal),
            (subAttributes[6] / socTotal),
            (subAttributes[7] / socTotal),
            (subAttributes[8] / socTotal),
            (subAttributes[9] / athTotal),
            (subAttributes[10] / athTotal),
            (subAttributes[11] / athTotal)
        ]
        print("\(name) initialized")
        alignment = nil
        alignmentInd = nil
    }
    
    mutating func setAnMA(which: Int, newVal: Int) {
        if which != 0 && which != 1 && which != 2 {
            print("Warning, setAnMA() called for an invalid main attribute index")
            return
        }
        let delta = newVal - mainAttributes[which]
        if mainAttrPts - delta >= 0 {
            if newVal >= mainAttrMin && newVal <= mainAttrLimit {
                mainAttributes[which] = newVal
                mainAttrPts -= delta
            }
        }
        else {
            mainAttributes[which] += mainAttrPts
            mainAttrPts = 0
        }
    }
    
    mutating func randomizeMAs() {
        mainAttributes[0] = mainAttrMin
        mainAttributes[1] = mainAttrMin
        mainAttributes[2] = mainAttrMin
        mainAttrPts = 55
        while mainAttrPts > 0 {
            let incrementInd = Int.random(in: 0...2)
            var incrementAmt = Int.random(in: 0...8)
            if incrementAmt > mainAttrPts {
                incrementAmt = mainAttrPts
            }
            if mainAttributes[incrementInd] + incrementAmt > 50 {
                incrementAmt = 50 - mainAttributes[incrementInd] 
            }
            mainAttributes[incrementInd] += incrementAmt
            mainAttrPts -= incrementAmt
        }
    }
    
    //map a question answer to a subattribute
    mutating func increaseSAs(list: [String : Float]) {
        if !hasSAPoints {
            for (which, amount) in list {
                if which == "mystery" {
                    hasEatenJuice = true
                    //choose 4 random values and 4 random stats to add the values to
                    let mysteryStats = [Float](repeating: Float.random(in: 0...4), count: 4)
                    let randomIndices : [Int] = [Int.random(in: 0...2), Int.random(in: 3...5), Int.random(in: 6...8), Int.random(in: 9...11)]
                    for i in 0..<mysteryStats.count {
                        subAttrRatios[randomIndices[i]] += mysteryStats[i]
                    }
                }
                else {
                    switch(which) {
                    case "int_c": subAttrRatios[0] += amount
                    case "int_w": subAttrRatios[1] += amount
                    case "int_a": subAttrRatios[2] += amount
                    case "spi_e": subAttrRatios[3] += amount
                    case "spi_r": subAttrRatios[4] += amount
                    case "spi_d": subAttrRatios[5] += amount
                    case "soc_e": subAttrRatios[6] += amount
                    case "soc_c": subAttrRatios[7] += amount
                    case "soc_f": subAttrRatios[8] += amount
                    case "ath_s": subAttrRatios[9] += amount
                    case "ath_c": subAttrRatios[10] += amount
                    case "ath_b": subAttrRatios[11] += amount
                    default: print("Warning: inceaseSAs() called on invalid sub-attribute: \(which)")
                    }
                }
            }
        }
        else {
            print("SA stat increase denied to \(name); stats have already been set!")
        }
    }
    
   mutating func calculateSARatios() {
        if !hasSARatios && !hasSAPoints {
            let intTotal = subAttrRatios[0] + subAttrRatios[1] + subAttrRatios[2]
            let spiTotal = subAttrRatios[3] + subAttrRatios[4] + subAttrRatios[5]
            let socTotal = subAttrRatios[6] + subAttrRatios[7] + subAttrRatios[8]
            let athTotal = subAttrRatios[9] + subAttrRatios[10] + subAttrRatios[11]
            
            subAttrRatios[0] /= intTotal
            subAttrRatios[1] /= intTotal
            subAttrRatios[2] /= intTotal
            subAttrRatios[3] /= spiTotal
            subAttrRatios[4] /= spiTotal
            subAttrRatios[5] /= spiTotal
            subAttrRatios[6] /= socTotal
            subAttrRatios[7] /= socTotal
            subAttrRatios[8] /= socTotal
            subAttrRatios[9] /= athTotal
            subAttrRatios[10] /= athTotal
            subAttrRatios[11] /= athTotal
            
            hasSARatios = true
            print("\(name)'s SA ratios have been evaluated")
        }
        else {
            print("SA ratio calculation denied to \(name); either stats have already been aligned or ratios have already been calculated!")
        }
    }
    
    mutating func alignSAs() {
        if !hasSAPoints && hasSARatios {
            if mainAttrPts == 0 {
                subAttributes[0] = subAttrRatios[0] * Float(mainAttributes[0])
                subAttributes[1] = subAttrRatios[1] * Float(mainAttributes[0])
                subAttributes[2] = subAttrRatios[2] * Float(mainAttributes[0])
                
                subAttributes[3] = subAttrRatios[3] * Float(mainAttributes[1])
                subAttributes[4] = subAttrRatios[4] * Float(mainAttributes[1])
                subAttributes[5] = subAttrRatios[5] * Float(mainAttributes[1])
                
                subAttributes[6] = subAttrRatios[6] * Float(mainAttributes[2])
                subAttributes[7] = subAttrRatios[7] * Float(mainAttributes[2])
                subAttributes[8] = subAttrRatios[8] * Float(mainAttributes[2])
                
                subAttributes[9] = subAttrRatios[9] * Float(mainAttributes[3])
                subAttributes[10] = subAttrRatios[10] * Float(mainAttributes[3])
                subAttributes[11] = subAttrRatios[11] * Float(mainAttributes[3])
                hasSAPoints = true
                print("\(name)'s SA points have been evaluated")
            }
            else {
                print("SA alignment denied to \(name); MAPs not yet fully allocated! \(mainAttrPts) MAPs left.")
            }
        }
        else {
            if hasSAPoints {
                print("SA alignment denied to \(name); stats have already been aligned!")
            }
            else if !hasSARatios {
                print("SA alignment denied to \(name); ratios have not yet been calculated!")
            }
        }
    }
    
    func printStatPoints() {
        print("Character name: \(name)")
        print("STATS")
        print ("Intellect: " + String(mainAttributes[0]))
            print ("   Creative: " + String(subAttributes[0]))
            print ("   Wise: " + String(subAttributes[1]))
            print ("   Analytical: " + String(subAttributes[2]))
        print ("Spirit: " + String(mainAttributes[1]))
            print ("   Empathetic: " + String(subAttributes[3]))
            print ("   Resilient: " + String(subAttributes[4]))
            print ("   Decisive: " + String(subAttributes[5]))
        print ("Sociability: " + String(mainAttributes[2]))
            print ("   Expressive: " + String(subAttributes[6]))
            print ("   Cooperative: " + String(subAttributes[7]))
            print ("   Friendly: " + String(subAttributes[8]))
        print ("Athletics: " + String(mainAttributes[3]))
            print ("   Swift: " + String(subAttributes[9]))
            print ("   Coordinated: " + String(subAttributes[10]))
            print ("   Big: " + String(subAttributes[11]))
    }
    
    func printSARatios() {
        print("Character name: \(name)")
        print("STAT GEOMETRY")
        print ("Intellect Ratios:")
            print ("   Creative: " + String(subAttrRatios[0]))
            print ("   Wise: " + String(subAttrRatios[1]))
            print ("   Analytical: " + String(subAttrRatios[2]))
        print ("Spirit Ratios:")
            print ("   Empathetic: " + String(subAttrRatios[3]))
            print ("   Resilient: " + String(subAttrRatios[4]))
            print ("   Decisive: " + String(subAttrRatios[5]))
        print ("Sociability Ratios:")
            print ("   Expressive: " + String(subAttrRatios[6]))
            print ("   Cooperative: " + String(subAttrRatios[7]))
            print ("   Friendly: " + String(subAttrRatios[8]))
        print ("Athletics Ratios:")
            print ("   Swift: " + String(subAttrRatios[9]))
            print ("   Coordinated: " + String(subAttrRatios[10]))
            print ("   Big: " + String(subAttrRatios[11]))
    }
    
    func printOnlyMAs() {
        print ("Intellect: " + String(mainAttributes[0]))
        print ("Spirit: " + String(mainAttributes[1]))
        print ("Sociability: " + String(mainAttributes[2]))
        print ("Athletics: " + String(mainAttributes[3]))
        print ("Points remaining: " + String(mainAttrPts))
    }
    
    mutating func setAlignment(a: String, i: Int) {
        alignment = a
        alignmentInd = i
    }
    
    func FindHighestSA() -> Float {
        var high : Float = 0.0
        for value in subAttributes {
            if high < value {
                high = value
            }
        }
        print("\(name)'s highest SA: \(high)")
        return high
    }
    
    func FindHighestRatio() -> Float {
        var high : Float = 0.0
        for value in subAttrRatios {
            if high < value {
                high = value
            }
        }
        print("\(name)'s highest SA: \(high)")
        return high
    }
}
