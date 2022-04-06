//
//  ViewController.swift
//  Fantasy World Quiz
//
//  Created by Daniel Ziems on 7/19/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//
import UIKit

class QuizAViewController: UIViewController {

    var quiz = QuizA()
    var userCharacter = Character()
    var areYouSureType = 0
    
    @IBOutlet weak var areYouSureView: UIView!
    @IBOutlet weak var areYouSureLabel: UILabel!
    
    @IBOutlet weak var answeringView: UIStackView!
        @IBOutlet weak var startOverButton: UIButton!
        @IBOutlet weak var questionNumberLabel: UILabel!
        @IBOutlet weak var mainBodyScrollView: UIScrollView!
        @IBOutlet weak var mainBodyText: UILabel!
        @IBOutlet weak var doneButton: UIButton!
        @IBOutlet weak var previousButton: UIButton!
        @IBOutlet weak var nextButton: UIButton!
        
        @IBOutlet var answerButtons: [UIButton]!
        @IBOutlet weak var defView: UIStackView!
    
    @IBOutlet weak var completedView: UIStackView!
    @IBOutlet weak var continuePrompt: UILabel!
    
    @IBOutlet weak var pageSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        answeringView.isHidden = false
        completedView.isHidden = true
        
        pageSlider.value = 0
        pageSlider.maximumValue = Float(quiz.qs.count - 1)
        areYouSureView.isHidden = true
        updateAnsUI()
        print("Quiz order: \(quiz.order)")
    }
    
    @IBAction func randomizePressed(_ sender: UIButton) {
        pauseUI()
        areYouSureLabel.text = "Randomize Answers?"
        areYouSureType = 2
    }
    
    @IBAction func pageSliderPressed(_ sender: UISlider) {
        quiz.currentPage = Int(sender.value)
        mainBodyScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        updateAnsUI()
    }
    
    @IBAction func prevNextPressed(_ sender: UIButton) {
        if sender.currentTitle == "Next" {
            if quiz.currentPage < quiz.qs.count - 1 {
                 quiz.currentPage += 1
            }
        }
        else {
            if quiz.currentPage > 0 {
                 quiz.currentPage -= 1
            }
        }
        mainBodyScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        updateAnsUI()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if quiz.answers[quiz.order[quiz.currentPage]] == quiz.unanswered {
            quiz.numAnswered += 1
        }
        quiz.answers[quiz.order[quiz.currentPage]] = sender.tag
        
        updateAnsUI()
    }
  
    func updateAnsUI() {
        //TOP-DOWN BY ITEM
        //page number
        questionNumberLabel.text = "Question " + String(quiz.currentPage + 1)
        
        //page slider
        pageSlider.value = Float(quiz.currentPage)
        
        //question label
        mainBodyText.text = quiz.getQ()
        
        //finished button
        if quiz.numAnswered == quiz.qs.count {
            doneButton.isHidden = false
        }
        else {
            doneButton.isHidden = true
        }
        
        //previous and next buttons
        if quiz.currentPage == quiz.qs.count - 1 {
            nextButton.isHidden = true
        }
        else {
            nextButton.isHidden = false
        }
        if quiz.currentPage == 0 {
            previousButton.isHidden = true
        }
        else {
            previousButton.isHidden = false
        }
        
        //toggle DEF appearance depending on if question has 3 or 6 answers
        if quiz.qs[quiz.order[quiz.currentPage]].type == 3 {
            defView.isHidden = true
        }
        else {
            defView.isHidden = false
        }
        
        //show which answer was chosen
        let currentAns = quiz.answers[quiz.order[quiz.currentPage]]
        for button in answerButtons {
            button.alpha = 0.5
            if button.tag == currentAns {
                button.alpha = 1.0
            }
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
           areYouSureLabel.text = "Finished?"
           areYouSureType = 1
           pauseUI()
       }
    
    func updateFinUI() {
        continuePrompt.text =
        """
        With that, you have completed the first section of the quiz. Excellent! For part 2, you must look inside yourself to assess your level of aptitude between three main attributes. If this is your first time taking the quiz, you are strongly advised to study exactly how these qualities are defined in the Attributes scroll.
        """
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AtoB" {
            let quizBvc = segue.destination as! QuizBViewController
            quizBvc.userCharacter = self.userCharacter
        }
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "AtoB", sender: self)
    }
    
    func pauseUI() {
        answeringView.alpha = 0.5
        answeringView.isUserInteractionEnabled = false
        
        areYouSureView.isHidden = false
    }
    func unpauseUI() {
        answeringView.alpha = 1.0
        answeringView.isUserInteractionEnabled = true
        
        areYouSureView.isHidden = true
    }
    
    @IBAction func startOverPressed(_ sender: UIButton) {
        pauseUI()
        areYouSureLabel.text = "Start over?"
        areYouSureType = 0
    }
    @IBAction func yesImSure(_ sender: UIButton) {
        unpauseUI()
        if areYouSureType == 0 {
            performSegue(withIdentifier: "AtoMenu", sender: self)
        }
        else if areYouSureType == 1 {
            answeringView.isHidden = true
            updateFinUI()
            quiz.printAnswers()
            //add stats to character by question ID and corresponding answer ID
            for i in 0..<quiz.qs.count {
                userCharacter.increaseSAs(list: quiz.qs[i].statsUp[quiz.answers[i]])
            }
            userCharacter.calculateSARatios()
            completedView.isHidden = false
        }
        else if areYouSureType == 2 {
            quiz.generateRandomAnswers()
            updateAnsUI()
        }
    }
    
    @IBAction func noImNotSure(_ sender: UIButton) {
        unpauseUI()
    }
}


