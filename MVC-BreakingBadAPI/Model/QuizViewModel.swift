//
//  QuizViewModel.swift
//  MVC-BreakingBadAPI
//
//  Created by Константин Трехперстов on 05.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Foundation

struct AnswerViewModel {
    let value: String
    let isCorrect: Bool
}

struct QuizViewModel {
    let question: String
    let image: String
    
    let answers: [AnswerViewModel]

}
