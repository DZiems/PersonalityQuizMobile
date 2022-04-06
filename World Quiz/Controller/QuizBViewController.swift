//
//  QuizBViewController.swift
//  World Quiz
//
//  Created by Daniel Ziems on 7/23/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//

import UIKit


class QuizBViewController: UIViewController {
    var userCharacter : Character?
    var pointsDelta = 0
    var statToChange = 0
    var areYouSureType = 0
    
    let requestName = "Attributes" //attributes scroll requested when pressing scroll button
    var timer : Timer?
    var scrollIsHovering = true

    @IBOutlet weak var areYouSureView: UIView!
    @IBOutlet weak var areYouSureLabel: UILabel!
    
    @IBOutlet weak var mainView: UIStackView!
    
    @IBOutlet weak var pointsLeftLabel: UILabel!
    
    //for a height reference
    @IBOutlet weak var intBarBackground: UIView!
    var maxBarDistance : CGFloat = 0.0
    @IBOutlet weak var pointSlider: UISlider!
    
    @IBOutlet weak var intellectBarHeight: NSLayoutConstraint!
    @IBOutlet weak var intellectValue: UILabel!
    @IBOutlet weak var plusIntButton: UIButton!
    
    @IBOutlet weak var spiritBarHeight: NSLayoutConstraint!
    @IBOutlet weak var spiritValue: UILabel!
    @IBOutlet weak var plusSpiButton: UIButton!
    
    @IBOutlet weak var sociabilityBarHeight: NSLayoutConstraint!
    @IBOutlet weak var sociabilityValue: UILabel!
    @IBOutlet weak var plusSocButton: UIButton!
    
    @IBOutlet weak var attributesButton: UIButton!
    @IBOutlet weak var infoScrollView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var completedView: UIStackView!
    @IBOutlet weak var continuePrompt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //initialize graphs
        
        
        doneButton.alpha = 0.5
        doneButton.isEnabled = false
        areYouSureView.isHidden = true
        
        plusSocButton.titleLabel?.adjustsFontSizeToFitWidth = true
        plusIntButton.titleLabel?.adjustsFontSizeToFitWidth = true
        plusSpiButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        updateNonBarUI()
        
        pointsLeftLabel.text = String(userCharacter!.mainAttrPts) + " points left"
        
        completedView.isHidden = true
        
        infoScrollView.isHidden = true
        infoScrollView.alpha = 0.0
    }
    
    //for some reason, constraints' constants aren't assigned relative to the actual device until viewDidAppear.
    //they are instead assigned relative to the canvas you build the app on in viewDidLoad, but not the device itself.
    override func viewDidAppear(_ animated: Bool) {
        maxBarDistance = intBarBackground.frame.size.height
        updateBarUI(0)
        updateBarUI(1)
        updateBarUI(2)
        initializeScrollHover()
        super.viewDidAppear(true)
        infoScrollView.isHidden = false
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseIn, animations: {
                self.infoScrollView.alpha = 1.0
                }, completion: nil)
    }
    
    func initializeScrollHover() {
        if scrollIsHovering {
            runISVHoverAnimation()
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.runISVHoverAnimation), userInfo: nil, repeats: true)
        }
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
    
    @IBAction func randomizePressed(_ sender: UIButton) {
        userCharacter!.randomizeMAs()
        updateAllUI()
    }
    
    @IBAction func plusStatChoicePressed(_ sender: UIButton) {
        if sender.currentTitle == "+ Spirit" {
            statToChange = 1
        }
        else if sender.currentTitle == "+ Sociability" {
            statToChange = 2
        }
        else {
            statToChange = 0
        }
        updateNonBarUI()
    }
    
    @IBAction func pointSliderPressed(_ sender: UISlider) {
        let val = Int(sender.value)
        userCharacter!.setAnMA(which: statToChange, newVal: val)
        updateNonBarUI()
        updateBarUI(statToChange)
    }
    
    func updateAllUI() {
        updateBarUI(0)
        updateBarUI(1)
        updateBarUI(2)
        updateNonBarUI()
    }
    
    func updateNonBarUI() {
        if statToChange == 0 {
            plusIntButton.alpha = 0.5
            plusSpiButton.alpha = 1.0
            plusSocButton.alpha = 1.0
        }
        else if statToChange == 1 {
            plusIntButton.alpha = 1.0
            plusSpiButton.alpha = 0.5
            plusSocButton.alpha = 1.0
        }
        else if statToChange == 2 {
            plusIntButton.alpha = 1.0
            plusSpiButton.alpha = 1.0
            plusSocButton.alpha = 0.5
        }
        
        //slider update
        pointSlider.value = Float(userCharacter!.mainAttributes[statToChange])
        
        //update remaining points indicator
        pointsLeftLabel.text = String(userCharacter!.mainAttrPts) + " points left"
        
        //check done button
        if (userCharacter!.mainAttrPts == 0) {
            doneButton.alpha = 1
            doneButton.isEnabled = true
        }
        else {
            doneButton.alpha = 0.5
            doneButton.isEnabled = false
        }
    }
    

    func updateBarUI(_ which: Int) {
        if which == 1 {
            let spiVal = userCharacter!.mainAttributes[1]
            let multiplier = 1 - (CGFloat(spiVal) / 50)
            spiritBarHeight.constant = maxBarDistance * multiplier
            spiritValue.text = String(spiVal)
        }
        else if which == 2 {
            let socVal = userCharacter!.mainAttributes[2]
            let multiplier = 1 - (CGFloat(socVal) / 50)
            sociabilityBarHeight.constant = maxBarDistance * multiplier
            sociabilityValue.text = String(socVal)
        }
        else {
            let intVal = userCharacter!.mainAttributes[0]
            let multiplier = 1 - (CGFloat(intVal) / 50)
            intellectBarHeight.constant = maxBarDistance * multiplier
            intellectValue.text = String(intVal)
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        areYouSureType = 1
        areYouSureLabel.text = "Finished?"
        pauseUI()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BtoInfo" {
            let infovc = segue.destination as! ReadInfoViewController
            infovc.requestedInfo = requestName
        }
        else if segue.identifier == "BtoResults" {
            let resultvc = segue.destination as! ResultViewController
            resultvc.userCharacter = self.userCharacter!
        }
    }
    
    @IBAction func attributesDetailsPressed(_ sender: UIButton) {
        scrollIsHovering = false
        performSegue(withIdentifier: "BtoInfo", sender: self)
    }
    
    func pauseUI() {
        mainView.alpha = 0.5
        mainView.isUserInteractionEnabled = false
        
        areYouSureView.isHidden = false
    }
    func unpauseUI() {
        mainView.alpha = 1.0
        mainView.isUserInteractionEnabled = true
        
        areYouSureView.isHidden = true
    }
    
    @IBAction func startOverPressed(_ sender: UIButton) {
        pauseUI()
        areYouSureType = 0
        areYouSureLabel.text = "Start over?"
    }
    
    
    @IBAction func yesImSure(_ sender: Any) {
        if areYouSureType == 0 {
            scrollIsHovering = false
            performSegue(withIdentifier: "BtoMenu", sender: self)
        }
        else if areYouSureType == 1 {
            mainView.isHidden = true
            scrollIsHovering = false
            completedView.isHidden = false
            userCharacter!.alignSAs()
            userCharacter!.printStatPoints()
            userCharacter!.printSARatios()
            updateFinUI()
            unpauseUI()
        }
    }
    @IBAction func noImNotSure(_ sender: Any) {
        unpauseUI()
    }
    func updateFinUI() {
        continuePrompt.text = """
        Congratulations on finishing the second and final section of the quiz! You must be shivering with anticipation for some results. That is totally understandable, maybe try some deep breathing or maybe take a short, unwinding walk. Gather yourself the best you can because in the end, you will need to press that Continue button. If your heartrate is stabilized and you're no longer hyperventilating, go for it!
        """
    }
    @IBAction func continuePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "BtoResults", sender: self)
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
