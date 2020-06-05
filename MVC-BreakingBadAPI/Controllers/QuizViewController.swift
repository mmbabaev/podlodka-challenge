//
//  QuizViewController.swift
//  MVC-BreakingBadAPI
//
//  Created by Mihail on 05.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

protocol QuizView: class {
    
    func displayCharacters()
    func displayQuiz(viewModel: QuizViewModel)
}


final class QuizViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

extension QuizViewController: QuizView {
    
    
}
