//
//  ViewController.swift
//  QuizNew
//
//  Created by Roman Ustiantcev on 14/03/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // set the label initial alpha
        nextQuestionLabel.alpha = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentQuestionLabel.text =  questions[currentQuestionIndex]
        
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel(){
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }

    @IBOutlet weak var currentQuestionLabel: UILabel!
    @IBOutlet weak var nextQuestionLabel: UILabel!
    
    // setting up constraints
    @IBOutlet weak var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    // answer label
    @IBOutlet weak var answerLabel: UILabel!
    
    let questions: [String] = ["From what cognac made?",
        "What is 7+7?",
        "What is the capital of Russia?"]
    let answers: [String] = ["Grapes", "14", "Moscow"]
    
    var currentQuestionIndex: Int = 0
    

    @IBAction func showNextQuestion(sender: AnyObject){
        currentQuestionIndex++
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(sender: AnyObject){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
        
    }
    
    func animateLabelTransitions(){
        
        // force any outstanding layout changes to occur
        view.layoutIfNeeded()
        
        // animate the alpha
        // and the center X constraints
        
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        UIView.animateWithDuration(0.5,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 5,
            options: [.CurveEaseInOut],
            animations: {
                self.currentQuestionLabel.alpha = 0
                self.nextQuestionLabel.alpha = 1
                
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                
                self.updateOffScreenLabel()
            })
    }
    
}

