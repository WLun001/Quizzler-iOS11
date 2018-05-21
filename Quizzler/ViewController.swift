//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let BUTTON_YES = 1
    let BUTTON_NO =  2
    let MAX_ANS = 13
    //Place your instance variables here
    let allQuestions = QuestionBank().list
    var questionCount = 0
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        checkAnswer(allQuestions[questionCount], sender.tag)
        nextQuestion()
        updateUI()
    }
    
    
    func updateUI() {
        questionLabel.text = (allQuestions[questionCount] as Question).questionText
        scoreLabel.text = String(score)
        progressLabel.text = "\(questionCount + 1)/\(MAX_ANS)"
    }
    

    func nextQuestion() {
        if  questionCount < MAX_ANS - 1{
            questionCount += 1
        }
    }
    
    
    func checkAnswer(_ ques: Question, _ response: Int) {
        if convertToBool(response) == ques.answer {
            score += 1
        }
    }
    
    
    func startOver() {
       
    }
    
    func convertToBool(_ i: Int) -> Bool {
        return i == BUTTON_YES ? true : false
    }
    

    
}
