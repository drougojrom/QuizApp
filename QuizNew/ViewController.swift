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
        questionLabel.alpha = 0
    }

    @IBOutlet weak var questionLabel: UILabel!
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
        questionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(sender: AnyObject){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
        
    }
    
    func animateLabelTransitions(){
        
        // animate the alpha
        UIView.animateWithDuration(0.5, animations: {
            self.questionLabel.alpha = 1
            })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text =  questions[currentQuestionIndex]
    }
    
}

