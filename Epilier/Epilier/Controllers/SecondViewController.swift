//
//  SecondViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 29.09.2021.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    lazy var serviceButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.backgroundColor = .gray
        button.setImage(UIImage(named: "services"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var studiesButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.setImage(UIImage(named: "masterButton"), for: .normal)
        button.setBackgroundImage(UIImage(named: "studiesButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        
        //button.backgroundColor = .gray
        return button
    }()
    
    lazy var reviewButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.backgroundColor = .gray
        button.setImage(UIImage(named: "reviewsButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var leftStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            serviceButton,
            studiesButton,
            reviewButton
            ])
        sv.axis = .vertical
        sv.spacing = 10
        sv.distribution = .fillEqually
        return sv
    }()
    
    lazy var mastersButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.setImage(UIImage(named: "masterButton"), for: .normal)
        button.setBackgroundImage(UIImage(named: "mastersButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        
        //button.backgroundColor = .gray
        return button
    }()
    
    lazy var interestButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.backgroundColor = .gray
        button.setImage(UIImage(named: "interestButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var rightStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            mastersButton,
            interestButton,
            ])
        sv.axis = .vertical
        sv.spacing = 10
        sv.distribution = .fillEqually
        return sv
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(leftStackView)
        self.view.addSubview(rightStackView)
        setNavBar()
        setConstraints()
    }
    
    func setNavBar(){
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: view.frame.size.width, height: 100))
        self.view.addSubview(navBar)

        let navItem = UINavigationItem(title: "Исследовать")
        navBar.setItems([navItem], animated: false)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            leftStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            leftStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            //verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            //verticalStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
            leftStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.47),
            leftStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -170),
            rightStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            rightStackView.leadingAnchor.constraint(equalTo: leftStackView.trailingAnchor, constant: 10),
            rightStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            rightStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -170),
            
        ])
    }
    
}
