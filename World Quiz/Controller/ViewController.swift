//
//  ViewController.swift
//  Fantasy World Quiz
//
//  Created by Daniel Ziems on 7/19/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    var quiz = QuizA()
    var character = Character()
    
    @IBOutlet weak var mainBodyText: UILabel!
    @IBOutlet weak var abcStackView: UIStackView!
    @IBOutlet weak var defStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
   
    @IBAction func answerPressed(_ sender: UIButton) {
        switch(sender.currentTitle!) {
        case "A" : character.increaseSAs(list: quiz.qs[quiz.order[quiz.currentInd]].statsUp[0])
        case "B" : character.increaseSAs(list: quiz.qs[quiz.order[quiz.currentInd]].statsUp[1])
        case "C" : character.increaseSAs(list: quiz.qs[quiz.order[quiz.currentInd]].statsUp[2])
        case "D" : character.increaseSAs(list: quiz.qs[quiz.order[quiz.currentInd]].statsUp[3])
        case "E" : character.increaseSAs(list: quiz.qs[quiz.order[quiz.currentInd]].statsUp[4])
        case "F" : character.increaseSAs(list: quiz.qs[quiz.order[quiz.currentInd]].statsUp[5])
        default: print("Invalid button pressed")
        }
        character.printStats()
        
        quiz.nextQuestion()
        
        updateUI()
    }
    
    func updateUI() {
        mainBodyText.text = quiz.getQ()
        if quiz.qs[quiz.order[quiz.currentInd]].type == 3 {
            defStackView.isHidden = true
            abcStackView.alignment = UIStackView.Alignment.center
        }
        else {
            defStackView.isHidden = false
            abcStackView.alignment = UIStackView.Alignment.fill
        }
    }
    
}

