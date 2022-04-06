//
//  EndingViewController.swift
//  World Quiz
//
//  Created by Daniel Ziems on 8/1/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//

import UIKit

class EndingViewController: UIViewController{
    var raceData : Races?
    var userCharacter : Character?
    var descriptionCatalogue = DescriptionCatalogue()
    @IBOutlet weak var pageScrollerView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scrollContentView: UIStackView!
    @IBOutlet weak var mainRaceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var specialtiesLabel: UILabel!
    
    
    
    //PAGE 2: lots of data and outlets for the graphs (please, xcode, give me a way to fold this).
    @IBOutlet weak var p2TitleLabel: UILabel!
    
    //the following four arrays cache the height values of a user's point/percent stats and the height values of the species's point/percent stats. CGFloat is used because these heights are constants for a bar's constraints.
    var userPointHeights = [CGFloat](repeating: 0.0, count: 12)
    var userPercentHeights = [CGFloat](repeating: 0.0, count: 12)
    var speciesPointHeights = [CGFloat](repeating: 0.0, count: 12)
    var speciesPercentHeights = [CGFloat](repeating: 0.0, count: 12)
    
    //cache an index for which race the user aligns with
    var rInd = -1
    
    //as a reference for max height
    @IBOutlet weak var creativityBarBlock: UIStackView!
    var maxBarDistance : CGFloat = 0.0
    
    //graph's key labels
    @IBOutlet weak var yourIntLabel: UILabel!
    @IBOutlet weak var speciesIntLabel: UILabel!
    @IBOutlet weak var yourSpiLabel: UILabel!
    @IBOutlet weak var speciesSpiLabel: UILabel!
    @IBOutlet weak var yourSocLabel: UILabel!
    @IBOutlet weak var speciesSocLabel: UILabel!
    @IBOutlet weak var yourAthLabel: UILabel!
    @IBOutlet weak var speciesAthLabel: UILabel!
    
    //graph height constraints (need to be sorted to specify which index is which)
    @IBOutlet var userGHCs: [NSLayoutConstraint]!
    @IBOutlet var speciesGHCs: [NSLayoutConstraint]!
    //graph value labels (also need to be sorted)
    @IBOutlet var userGVLs: [UILabel]!
    @IBOutlet var speciesGVLs: [UILabel]!
    
    //toggle for poinst vs percents on page 2's display
    var pointsPageIsActive : Bool = true
    
    //PAGE 3
    var p3RequesedInfo : String?
    @IBOutlet weak var p3YouSureView: UIView!
    @IBOutlet weak var p3YouSureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageController.numberOfPages = Int(scrollContentView.frame.size.width /  pageScrollerView.frame.size.width)
        pageScrollerView.showsHorizontalScrollIndicator = false
        pageScrollerView.showsVerticalScrollIndicator = false
        userGHCs = userGHCs.sorted {
            $0.firstItem!.tag < $1.firstItem!.tag
        }
        speciesGHCs = speciesGHCs.sorted {
            $0.firstItem!.tag < $1.firstItem!.tag
        }
        userGVLs = userGVLs.sorted {
            $0.tag < $1.tag
        }
        speciesGVLs = speciesGVLs.sorted {
            $0.tag < $1.tag
        }
        p3YouSureView.isHidden = true
//        print("Sorting verification test:")
//        print("UserGVLs tags:")
//        for i in userGVLs {
//            print(i.tag, terminator: ", ")
//        }
//        print()
//        print("UserGHCs firstElement tags:")
//        for i in userGHCs {
//            print(i.firstItem!.tag!, terminator: ", ")
//        }
//        print()
        self.pageScrollerView.delegate = self
        rInd = userCharacter!.alignmentInd!
        setUpPage1()
    }
    //for some reason, constraints' constants aren't assigned relative to the actual device until viewDidAppear.
    //they are instead assigned relative to the canvas you build the app on in viewDidLoad, but not the device itself.
    override func viewDidAppear(_ animated: Bool) {
        setUpPage2()
        super.viewDidAppear(true)
    }
    func setUpPage1() {
        mainRaceLabel.text = userCharacter!.alignment
        descriptionLabel.text = descriptionCatalogue.descriptions[userCharacter!.alignmentInd!]
        specialtiesLabel.text = descriptionCatalogue.specialties[userCharacter!.alignmentInd!]
    }
    func setUpPage2() {
        maxBarDistance = creativityBarBlock.frame.size.height
        p2setPointHeights()
        p2SetPercentHeights()
        updateP2UI()
    }
    
    func p2setPointHeights() {
        let userMaxSA = userCharacter!.FindHighestSA()
        let speciesMaxSA = raceData!.races[rInd].FindHighestSA()
        var divisor : CGFloat?
        if userMaxSA > speciesMaxSA {
            divisor = userMaxSA > 20 ? CGFloat(userMaxSA) : 20
        }
        else {
            divisor = speciesMaxSA > 20 ? CGFloat(speciesMaxSA) : 20
        }
        //set user's heights
        for i in 0..<userPointHeights.count {
            userPointHeights[i] = maxBarDistance - (maxBarDistance * (CGFloat(userCharacter!.subAttributes[i]) / divisor!))
        }
        //set species's heights
        for i in 0..<speciesPointHeights.count {
            speciesPointHeights[i] = maxBarDistance - (maxBarDistance * (CGFloat(raceData!.races[rInd].subAttributes[i]) / divisor!))
        }
    }
    
    func p2SetPercentHeights() {
        let userMaxSAR = userCharacter!.FindHighestRatio()
        let speciesMaxSAR = raceData!.races[rInd].FindHighestRatio()
        var divisor : CGFloat?
        if userMaxSAR > speciesMaxSAR {
            divisor = userMaxSAR > 0.5 ? CGFloat(userMaxSAR) : 0.5
        }
        else {
            divisor = speciesMaxSAR > 0.5 ? CGFloat(speciesMaxSAR) : 0.5
        }
        //set user's heights
        for i in 0..<userPercentHeights.count {
            userPercentHeights[i] = maxBarDistance - (maxBarDistance * (CGFloat(userCharacter!.subAttrRatios[i]) / divisor!))
        }
        //set species's heights
        for i in 0..<speciesPercentHeights.count {
            speciesPercentHeights[i] = maxBarDistance - (maxBarDistance * (CGFloat(raceData!.races[rInd].subAttrRatios[i]) / divisor!))
        }
    }
    
    @IBAction func p2TogglePressed(_ sender: UIButton) {
        pointsPageIsActive = !pointsPageIsActive
        updateP2UI()
    }
    
    func updateP2UI() {
        if pointsPageIsActive {
            p2TitleLabel.text = "Points"
            
            speciesIntLabel.text = "Species Average (" + String(raceData!.races[rInd].mainAttributes[0]) + ")"
            yourIntLabel.text = "Your Intellect (" + String(userCharacter!.mainAttributes[0]) + ")"
            speciesSpiLabel.text = "Species Average (" + String(raceData!.races[rInd].mainAttributes[1]) + ")"
            yourSpiLabel.text = "Your Spirit (" + String(userCharacter!.mainAttributes[1]) + ")"
            speciesSocLabel.text = "Species Average (" + String(raceData!.races[rInd].mainAttributes[2]) + ")"
            yourSocLabel.text = "Your Sociability (" + String(userCharacter!.mainAttributes[2]) + ")"
            speciesAthLabel.text = "Species Average (" + String(raceData!.races[rInd].mainAttributes[3]) + ")"
            yourAthLabel.text = "Your Physicality (" + String(userCharacter!.mainAttributes[3]) + ")"
            
            for i in 0..<userGHCs.count {
                userGHCs[i].constant = userPointHeights[i]
                userGVLs[i].text = String(format: "%.1f", userCharacter!.subAttributes[i])
            }
            for i in 0..<speciesGHCs.count {
                speciesGHCs[i].constant = speciesPointHeights[i]
                speciesGVLs[i].text = String(format: "%.1f", raceData!.races[rInd].subAttributes[i])
            }
        }
        else {
            p2TitleLabel.text = "Percentages"
            
            speciesIntLabel.text = "Species Average"
            yourIntLabel.text = "Your Intellect"
            speciesSpiLabel.text = "Species Average"
            yourSpiLabel.text = "Your Spirit"
            speciesSocLabel.text = "Species Average"
            yourSocLabel.text = "Your Sociability"
            speciesAthLabel.text = "Species Average"
            yourAthLabel.text = "Your Physicality"
            
            for i in 0..<userGHCs.count {
                userGHCs[i].constant = userPercentHeights[i]
                userGVLs[i].text = String(format: "%.1f", 100 * userCharacter!.subAttrRatios[i]) + "%"
            }
            for i in 0..<speciesGHCs.count {
                speciesGHCs[i].constant = speciesPercentHeights[i]
                speciesGVLs[i].text = String(format: "%.1f", 100 * raceData!.races[rInd].subAttrRatios[i]) + "%"
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EndingtoInfo" {
            let infovc = segue.destination as! ReadInfoViewController
            infovc.requestedInfo = self.p3RequesedInfo!
        }
    }
    
    @IBAction func scrollButtonPressed(_ sender: UIButton) {
        if sender.accessibilityLabel == "WASLabel" {
            p3RequesedInfo = "World and Species"
            performSegue(withIdentifier: "EndingtoInfo", sender: self)
        }
        if sender.accessibilityLabel == "QDLabel" {
            p3RequesedInfo = "Quiz Details"
            performSegue(withIdentifier: "EndingtoInfo", sender: self)
        }
    }
    
    @IBAction func backToMenuPressed(_ sender: UIButton) {
        pauseUI()
    }
    
    @IBAction func noImNotSure(_ sender: UIButton) {
        unpauseUI()
    }
    
    @IBAction func yesImSure(_ sender: UIButton) {
        performSegue(withIdentifier: "EndingtoMenu", sender: self)
    }
    
    func pauseUI() {
        pageScrollerView.alpha = 0.5
        pageController.alpha = 0.5
        pageScrollerView.isUserInteractionEnabled = false
        
        p3YouSureLabel.text =
        """
        Leave for Main Menu?
        Results won't be saved!
        """
        p3YouSureView.isHidden = false
    }
    
    func unpauseUI() {
        pageScrollerView.alpha = 1
        pageController.alpha = 1
        pageScrollerView.isUserInteractionEnabled = true
        
        p3YouSureView.isHidden = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EndingViewController : UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}
