//
//  ReadInfoViewController.swift
//  World Quiz
//
//  Created by Daniel Ziems on 7/26/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//

import UIKit

class ReadInfoViewController: UIViewController {
    
    let requestPossibility1 = "World and Species"
    let requestPossibility2 = "Quiz Details"
    let requestPossibility3 = "Attributes"
    var requestedInfo : String?
    
    let sc = ScrollCollection()
    var currentPage = 0
    var scrollIsHovering : [Bool]?
    var timerIsRunning = false
    var timer : Timer?
    var scrollOriginPos : CGFloat?
    
    
    @IBOutlet weak var chapterOverviewView: UIView!
    @IBOutlet weak var pageReaderView: UIView!
    @IBOutlet weak var scrollChaptersView: UIView!
    
    @IBOutlet weak var titleOfReading: UILabel!
    @IBOutlet weak var chapterButton: UIButton!
    @IBOutlet weak var chapterLabel: UILabel!
    @IBOutlet weak var previousButtonCOV: UIButton!
    @IBOutlet weak var nextButtonCOV: UIButton!
    @IBOutlet weak var previousButtonPRV: UIButton!
    @IBOutlet weak var nextButtonPRV: UIButton!
    
    @IBOutlet weak var scrollViewPRV: UIScrollView!
    @IBOutlet weak var readerText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //scroll hover
        scrollIsHovering = [Bool](repeating: true, count: sc.scrolls[requestedInfo!]!.pages.count)
        scrollOriginPos = scrollChaptersView.frame.origin.y
        scrollChaptersView.isHidden = true
        scrollChaptersView.alpha = 0.0
        //get requested info reading
        updateCOUI()
        
        titleOfReading.text = requestedInfo!
        chapterOverviewView.isHidden = false
        pageReaderView.isHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        scrollChaptersView.isHidden = false
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseIn, animations: {
                self.scrollChaptersView.alpha = 1.0
                }, completion: nil)
    }

    
    //store who sent you to this screen, then make a segue back to wherever you came
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextOrPreviousPressed(_ sender: UIButton) {
        if sender.currentTitle == "Next" {
            if currentPage < (sc.scrolls[requestedInfo!]!.pages.count - 1) {
                currentPage += 1
            }
        }
        else {
            if currentPage > 0 {
                currentPage -= 1
            }
        }
        if chapterOverviewView.isHidden {
            scrollIsHovering![currentPage] = false
            updatePRUI()
        }
        else {
            updateCOUI()
        }
    }
    
    func updateCOUI() {
        chapterLabel.text = sc.scrolls[requestedInfo!]!.pageTitle[currentPage]
        if scrollIsHovering![currentPage] {
            if !timerIsRunning {
                runISVHoverAnimation()
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.runISVHoverAnimation), userInfo: nil, repeats: true)
                timerIsRunning = true
            }
        }
        else {
            timer?.invalidate()
            timerIsRunning = false
        }
        
        if currentPage == 0 {
            previousButtonCOV.isHidden = true
        }
        else {
            previousButtonCOV.isHidden = false
        }
        if currentPage == sc.scrolls[requestedInfo!]!.pages.count - 1 {
            nextButtonCOV.isHidden = true
        }
        else {
            nextButtonCOV.isHidden = false
        }
        
    }
    
    @objc func runISVHoverAnimation() {
        if scrollIsHovering![currentPage] {
            var timeCount = 0.0
            UIView.animate(withDuration: 0.25, delay: timeCount, options: .curveEaseOut, animations: {
                self.scrollChaptersView.frame.origin.y -= 3
            })
            timeCount += 0.25
            UIView.animate(withDuration: 0.25, delay: timeCount, options: .curveEaseIn, animations: {
                self.scrollChaptersView.frame.origin.y = self.scrollOriginPos!
            })
            timeCount += 0.25
            UIView.animate(withDuration: 0.25, delay: timeCount, options: .curveEaseOut, animations: {
                self.scrollChaptersView.frame.origin.y += 3
            })
            timeCount += 0.25
            UIView.animate(withDuration: 0.25, delay: timeCount, options: .curveEaseIn, animations: {
                self.scrollChaptersView.frame.origin.y = self.scrollOriginPos!
            })
        }
        else {
            timer?.invalidate()
            timerIsRunning = false
        }
    }
    
    @IBAction func chapterButtonPressed(_ sender: UIButton) {
        chapterOverviewView.isHidden = true
        pageReaderView.isHidden = false
        scrollIsHovering![currentPage] = false
        updatePRUI()
    }
    func updatePRUI() {
        if currentPage == 0 {
            previousButtonPRV.isHidden = true
        }
        else {
            previousButtonPRV.isHidden = false
        }
        if currentPage == sc.scrolls[requestedInfo!]!.pages.count - 1 {
            nextButtonPRV.isHidden = true
        }
        else {
            nextButtonPRV.isHidden = false
        }
        scrollViewPRV.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        readerText.text = sc.scrolls[requestedInfo!]!.pages[currentPage]
    }
    
    @IBAction func backtoCOPressed(_ sender: Any) {
        pageReaderView.isHidden = true
        chapterOverviewView.isHidden = false
        updateCOUI()
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
