//
//  ViewController.swift
//  Clean Swift
//
//  Created by Ernest Migranov on 18.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Перейти к таблице", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(nextFunc), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(nextButton)
        setConstraints()
    }

    @objc func nextFunc(){
        //self.present(ArticleViewController(), animated: true, completion: nil)
        self.navigationController?.pushViewController(ArticlesViewController(), animated: true)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

