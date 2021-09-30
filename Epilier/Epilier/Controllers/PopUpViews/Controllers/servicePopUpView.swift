//
//  ChildViewController.swift
//  FluidTransition
//
//  Created by Mikhail Rubanov on 07/07/2019.
//  Copyright © 2019 akaDuality. All rights reserved.
//

import UIKit

class servicePopUpView: UIViewController {
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dismissButton"), for: .normal)
        button.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var chooseButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 24
        button.backgroundColor = UIColor(hexString: "#C8EFF4")
        button.setTitle("Выбрать", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.layer.cornerRadius = 24
        self.view.addSubview(dismissButton)
        self.view.addSubview(chooseButton)
        
        setConstraints()
        //addDismissButton()
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor),
            dismissButton.widthAnchor.constraint(equalToConstant: 150),
            dismissButton.heightAnchor.constraint(equalToConstant: 30),
            
            chooseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -35),
            chooseButton.widthAnchor.constraint(equalToConstant: 300),
            chooseButton.heightAnchor.constraint(equalToConstant: 40),
            ])
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true)
    }
}
