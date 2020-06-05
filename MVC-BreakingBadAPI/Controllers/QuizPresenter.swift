//
//  QuizService.swift
//  MVC-BreakingBadAPI
//
//  Created by Константин Трехперстов on 05.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Foundation

class QuizPresenter {
    
    var characters: [Character] = []
    weak var view: QuizView?
    let service = Characters()
    
    init(view: QuizView) {
        self.view = view
    }
    
    
    func viewDidLoad() {
        
        service.delegate = self
        
        service.loadAll()
    }
    
    func loadQuiz() {
        Quote.getRandomQuote { result  in
            switch result {
            case .success(let quote):
                let rightAnswer = AnswerViewModel(value: quote.author, isCorrect: true)
                let wrongAnswer = AnswerViewModel(value: self.characters.first(where: { $0.name != quote.author })!.name, isCorrect: false)
                let viewModel = QuizViewModel(question: "How said that: \(quote.quote)?", image: "", answers: [rightAnswer, wrongAnswer])
            case .failure:
                print("error")
            }
        }
    }
}

extension QuizPresenter: CharactersProtocol {
    
    func didChangedChatacters(result: Result<[Character], Error>) {
        switch result {
        case .success(let characters):
            self.characters = characters
            self.loadQuiz()
        case .failure:
            print("error")
        }
    }
}


