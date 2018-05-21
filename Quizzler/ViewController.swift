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
        progressLabel.text = "\(questionCount + 1)/\(allQuestions.count)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.count)) * CGFloat(questionCount + 1)
    }
    

    func nextQuestion() {
        if  questionCount < allQuestions.count - 1{
            questionCount += 1
        } else {
            let alert = UIAlertController(title: "Awesome", message: "You have finished all questions. Do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default , handler: { (UIAlertAction) in
                self.startOver()
                self.updateUI()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer(_ ques: Question, _ response: Int) {
        if convertToBool(response) == ques.answer {
            score += 1
        }
    }
    
    
    func startOver() {
        questionCount = 0
        score = 0
       
    }
    
    func convertToBool(_ i: Int) -> Bool {
        return i == BUTTON_YES ? true : false
    }
}
