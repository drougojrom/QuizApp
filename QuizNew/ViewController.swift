//
//  ViewController.swift
//  QuizNew
//
//  Created by Roman Ustiantcev on 14/03/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    }
    
    @IBAction func showAnswer(sender: AnyObject){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text =  questions[currentQuestionIndex]
    }
    
}

