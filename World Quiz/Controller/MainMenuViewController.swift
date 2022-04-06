//
//  EntryViewController.swift
//  World Quiz
//
//  Created by Daniel Ziems on 7/22/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    var reachedScrollPage : Bool = false
    //for segue to info scroll reader
    let requestName = "World and Species"
    var scrollIsHovering : Bool = false
    var timer : Timer?
    @IBOutlet weak var introTextLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var infoScrollView: UIView!
    @IBOutlet weak var infoButtonWorld: UIButton!
    var intro = EntryViewIntroductionText()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        infoScrollView.isHidden = true
        infoScrollView.alpha = 0.0
        infoButtonWorld.isEnabled = false
        updateUI()
    }
    
    @IBAction func pageButtonPressed(_ sender: UIButton) {
        if sender.currentTitle == "Previous" {
            if intro.currentPage > 0 {
                intro.currentPage -= 1
            }
        }
        else {
            if intro.currentPage < (intro.pages.count - 1) {
                intro.currentPage += 1
            }
        }
        updateUI()
    }
    
    func updateUI() {
        introTextLabel.text = intro.pages[intro.currentPage]
        
        if intro.currentPage == 0 {
            previousButton.isHidden = true
        }
        else {
            previousButton.isHidden = false
        }
        if intro.currentPage == (intro.pages.count - 1) {
            nextButton.isHidden = true
            startButton.setTitle("Begin Quiz", for: .normal)
        }
        else {
            nextButton.isHidden = false
            startButton.setTitle("Skip Introduction and Begin", for: .normal)
        }
        if intro.currentPage == intro.scrollOfferPage {
            if infoScrollView.isHidden == true {
                infoScrollView.isHidden = false
                infoButtonWorld.isEnabled = true
                scrollIsHovering = true
                runISVHoverAnimation()
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.runISVHoverAnimation), userInfo: nil, repeats: true)
                UIView.animate(withDuration: 1.5, delay: 0.0, options: .curveEaseIn, animations: {
                    self.infoScrollView.alpha = 1.0
                }, completion: nil)
            }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenutoInfo" {
            let infovc = segue.destination as! ReadInfoViewController
            infovc.requestedInfo = requestName
        }
    }
    
    @IBAction func beginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "MenutoA", sender: self)
    }
    
    @IBAction func worldDetailsPressed(_ sender: UIButton) {
        scrollIsHovering = false
        performSegue(withIdentifier: "MenutoInfo", sender: self)
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
