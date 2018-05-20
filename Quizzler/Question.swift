//
//  Question.swift
//  Quizzler
//
//  Created by Wei Lun on 21/05/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        self.questionText = text
        self.answer = correctAnswer
    }
}
