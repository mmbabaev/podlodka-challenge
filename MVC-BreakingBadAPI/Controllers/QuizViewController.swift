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
    
    @IBOutlet weak var questionLabel: UILabel!
    
    private var presenter: QuizPresenter!

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    var answers: [AnswerViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = QuizPresenter(view: self)
        presenter.viewDidLoad()
    }
    
    @IBAction func button1pressed(_ sender: Any) {
        let alert = UIAlertController(title: "Correct", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func button2pressed(_ sender: Any) {
        let alert = UIAlertController(title: "Wrong", message: nil, preferredStyle: .alert)
               
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               
               present(alert, animated: true, completion: nil)
               
            
    }
}

extension QuizViewController: QuizView {
    func displayQuiz(viewModel: QuizViewModel) {
        questionLabel.text = viewModel.question
        
        answers = viewModel.answers
        
        button1.setTitle(viewModel.answers.first!.value, for: .normal)
        button2.setTitle(viewModel.answers.last!.value, for: .normal)
    }
    
    
}
