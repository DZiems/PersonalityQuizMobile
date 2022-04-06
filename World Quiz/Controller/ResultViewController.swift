//
//  ResultViewController.swift
//  World Quiz
//
//  Created by Daniel Ziems on 7/30/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var userCharacter : Character?
    var raceData = Races()
    var intro = ResultViewIntroText()
    //corresponds to raceData choice
    var choice = -1
    
    let requestName = "World and Species"
    
    var scrollIsHovering = true
    var timer : Timer?
    
    @IBOutlet weak var choosingView: UIStackView!
    @IBOutlet weak var introText: UILabel!
    @IBOutlet weak var prevNextView: UIStackView!
    @IBOutlet weak var previousButtonCV: UIButton!
    @IBOutlet weak var nextButtonCV: UIButton!
    
    @IBOutlet weak var species1RevealerView: UIView!
    @IBOutlet weak var species1RevealedView: UIStackView!
    @IBOutlet weak var species1Label: UILabel!
    @IBOutlet weak var species1AlignLabel: UILabel!
    @IBOutlet weak var species1Button: UIButton!
    
    @IBOutlet weak var species2View: UIView!
    @IBOutlet weak var species2RevealerView: UIView!
    @IBOutlet weak var species2RevealedView: UIStackView!
    @IBOutlet weak var species2Label: UILabel!
    @IBOutlet weak var species2AlignLabel: UILabel!
    @IBOutlet weak var species2Button: UIButton!
    
    @IBOutlet weak var species3View: UIView!
    @IBOutlet weak var species3RevealerView: UIView!
    @IBOutlet weak var species3RevealedView: UIStackView!
    @IBOutlet weak var species3Label: UILabel!
    @IBOutlet weak var species3AlignLabel: UILabel!
    @IBOutlet weak var species3Button: UIButton!
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var infoScrollView: UIView!
    @IBOutlet weak var w_a_sScrollButton: UIButton!
    
    @IBOutlet weak var areYouSureView: UIView!
    @IBOutlet weak var areYouSureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        infoScrollView.isHidden = true
        infoScrollView.alpha = 0.0
        initializeScrollHover()
        setUpChoosingView()
    }
    
    func initializeScrollHover() {
        if scrollIsHovering {
            runISVHoverAnimation()
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.runISVHoverAnimation), userInfo: nil, repeats: true)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        infoScrollView.isHidden = false
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseIn, animations: {
                self.infoScrollView.alpha = 1.0
                }, completion: nil)
    }
    @objc func runISVHoverAnimation() {
        if scrollIsHovering {
            let origin = self.infoScrollView.frame.origin.y
            var timeCount = 0.0
            UIView.animate(withDuration: 0.25, delay: timeCount, options: .curveEaseOut, animations: {
                self.infoScrollView.frame.origin.y -= 3
            })
            timeCount += 0.25
            UIView.animate(withDuration: 0.25, delay: timeCount, options: .curveEaseIn, animations: {
                self.infoScrollView.frame.origin.y = origin
            })
            timeCount += 0.25
            UIView.animate(withDuration: 0.25, delay: timeCount, options: .curveEaseOut, animations: {
                self.infoScrollView.frame.origin.y += 3
            })
            timeCount += 0.25
            UIView.animate(withDuration: 0.25, delay: timeCount, options: .curveEaseIn, animations: {
                self.infoScrollView.frame.origin.y = origin
            })
        }
        else {
            timer?.invalidate()
        }
    }
    
    
    func setUpChoosingView() {
        raceData.calculateAlignmentResults(user: userCharacter!)
        
        choosingView.isHidden = false
        areYouSureView.isHidden = true
        
        if raceData.top3.count == 3 {
            species1RevealerView.isHidden = false
            species1RevealedView.isHidden = true
            species2RevealerView.isHidden = false
            species2RevealedView.isHidden = true
            species3RevealerView.isHidden = false
            species3RevealedView.isHidden = true
            
            
            species1Label.text = raceData.races[raceData.top3[0]].name
            species1AlignLabel.text = String(format: "%.1f", raceData.combLs[raceData.top3[0]] * 10) + "%"
            
            species2Label.text = raceData.races[raceData.top3[1]].name
            species2AlignLabel.text = String(format: "%.1f", raceData.combLs[raceData.top3[1]] * 10) + "%"
            
            species3Label.text = raceData.races[raceData.top3[2]].name
            species3AlignLabel.text = String(format: "%.1f", raceData.combLs[raceData.top3[2]] * 10) + "%"
            
            continueButton.isEnabled = false
            continueButton.alpha = 0.5
        }
            
        else if raceData.top3.count == 2 {
            species1RevealerView.isHidden = false
            species1RevealedView.isHidden = true
            species2RevealerView.isHidden = false
            species2RevealedView.isHidden = true
    
            species3View.isHidden = true
            
            species1Label.text = raceData.races[raceData.top3[0]].name
            species1AlignLabel.text = String(format: "%.1f", raceData.combLs[raceData.top3[0]] * 10) + "%"
            
            species2Label.text = raceData.races[raceData.top3[1]].name
            species2AlignLabel.text = String(format: "%.1f", raceData.combLs[raceData.top3[1]] * 10) + "%"
            
            continueButton.isEnabled = false
            continueButton.alpha = 0.5
        }
            
        else {
            species1RevealerView.isHidden = false
            species1RevealedView.isHidden = true
            
            species3View.isHidden = true
            species2View.isHidden = true
            
            species1Label.text = raceData.races[raceData.top3[0]].name
            species1AlignLabel.text = String(format: "%.1f", raceData.combLs[raceData.top3[0]] * 10) + "%"
            
            species1Button.isHidden = true
        }
        
        updateChoosingIntroUI()
    }
    
    func updateChoosingIntroUI() {
        if raceData.top3.count == 1 {
            prevNextView.isHidden = true
            introText.text = intro.firstPage[0]
        }
        else if raceData.top3.count == 2 {
            if intro.pageNumber == 0 {
                previousButtonCV.isHidden = true
                introText.text = intro.firstPage[1]
            }
            else {
                previousButtonCV.isHidden = false
                introText.text = intro.remainingPages[intro.pageNumber]
            }
            if intro.pageNumber >= intro.remainingPages.count - 1 {
                nextButtonCV.isHidden = true
            }
            else {
                nextButtonCV.isHidden = false
            }
        }
        else if raceData.top3.count == 3 {
            if intro.pageNumber == 0 {
                previousButtonCV.isHidden = true
                introText.text = intro.firstPage[2]
            }
            else {
                previousButtonCV.isHidden = false
                introText.text = intro.remainingPages[intro.pageNumber]
            }
            if intro.pageNumber >= intro.remainingPages.count - 1 {
                nextButtonCV.isHidden = true
            }
            else {
                nextButtonCV.isHidden = false
            }
        }
    }
    
    @IBAction func prevNextPressed(_ sender: UIButton) {
        if sender.currentTitle == "Previous" {
            if intro.pageNumber > 0 {
                intro.pageNumber -= 1
            }
        }
        else {
            if intro.pageNumber < intro.remainingPages.count - 1 {
                intro.pageNumber += 1
            }
        }
        updateChoosingIntroUI()
    }
    
    @IBAction func revealPressed(_ sender: UIButton) {
        if raceData.top3.count == 1 {
            continueButton.alpha = 1.0
            continueButton.isEnabled = true
        }
        if sender.accessibilityLabel == "revealer1" {
            UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseIn, animations: {
                self.species1RevealerView.alpha = 0.0
            }, completion: { (finished: Bool) in
                self.species1RevealerView.isHidden = true})
            species1RevealedView.isHidden = false
        }
        else if sender.accessibilityLabel == "revealer2" {
            UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseIn, animations: {
                self.species2RevealerView.alpha = 0.0
            }, completion: { (finished: Bool) in
            self.species2RevealerView.isHidden = true})
            species2RevealedView.isHidden = false
        }
        else {
            UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseIn, animations: {
                self.species3RevealerView.alpha = 0.0
            }, completion: { (finished: Bool) in
            self.species3RevealerView.isHidden = true})
            species3RevealedView.isHidden = false
        }
    }
    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        if sender.accessibilityLabel == "choice1" {
            choice = 0
        }
        else if sender.accessibilityLabel == "choice2" {
            choice = 1
        }
        else if sender.accessibilityLabel == "choice3" {
            choice = 2
        }
        updateChoiceButtonUI()
    }
    
    func updateChoiceButtonUI() {
        if choice != -1 {
            if choice == 0 {
                species1Button.alpha = 0.5
                species2Button.alpha = 1.0
                species3Button.alpha = 1.0
            }
            else if choice == 1 {
                species2Button.alpha = 0.5
                species1Button.alpha = 1.0
                species3Button.alpha = 1.0
            }
            else if choice == 2 {
                species3Button.alpha = 0.5
                species1Button.alpha = 1.0
                species2Button.alpha = 1.0
            }
            continueButton.alpha = 1.0
            continueButton.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResulttoInfo" {
            let infovc = segue.destination as! ReadInfoViewController
            infovc.requestedInfo = requestName
        }
        if segue.identifier == "ResulttoEnding" {
            let endingvc = segue.destination as! EndingViewController
            endingvc.userCharacter = self.userCharacter!
            endingvc.raceData = self.raceData
        }
    }
    
    @IBAction func w_a_sScrollPressed(_ sender: Any) {
        performSegue(withIdentifier: "ResulttoInfo", sender: self)
    }
    
    func pauseUI() {
        if choosingView.isHidden == false {
            choosingView.alpha = 0.5
            choosingView.isUserInteractionEnabled = false
            
            areYouSureView.isHidden = false
        }
    }
    func unpauseUI() {
        if choosingView.isHidden == false {
            choosingView.alpha = 1.0
            choosingView.isUserInteractionEnabled = true
            
            areYouSureView.isHidden = true
        }
    }
    
    @IBAction func continuePressed(_ sender: UIButton) {
        if raceData.top3.count > 1 {
            areYouSureLabel.text = "Are you " + String(raceData.races[raceData.top3[choice]].name) + "?"
            pauseUI()
        }
        else {
            userCharacter!.setAlignment(a: String(raceData.races[raceData.top3[0]].name), i: raceData.top3[0])
            performSegue(withIdentifier: "ResulttoEnding", sender: self)
        }
    }
    
    @IBAction func yesImSure(_ sender: UIButton) {
        unpauseUI()
        userCharacter!.setAlignment(a: String(raceData.races[raceData.top3[choice]].name), i: raceData.top3[choice])
        print("aligned: \(userCharacter!.alignment ?? "Not yet aligned") and corresponding index: \(userCharacter!.alignmentInd ?? -1)")
        performSegue(withIdentifier: "ResulttoEnding", sender: self)
    }
    
    @IBAction func noImNotSure(_ sender: UIButton) {
        unpauseUI()
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
