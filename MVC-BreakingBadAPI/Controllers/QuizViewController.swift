//
//  QuizViewController.swift
//  MVC-BreakingBadAPI
//
//  Created by Mihail on 05.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

protocol QuizView: class {
    func displayQuiz(viewModel: QuizViewModel)
}


final class QuizViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    private var presenter: QuizPresenter!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = QuizPresenter(view: self)
        presenter.viewDidLoad()
    }
}

extension QuizViewController: QuizView {
    func displayQuiz(viewModel: QuizViewModel) {
        questionLabel.text = viewModel.question
        for answers in viewModel.answers {
            
        }
    }
}
