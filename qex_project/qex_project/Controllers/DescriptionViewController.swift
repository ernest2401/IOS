//
//  DescriptionViewController.swift
//  twitch
//
//  Created by Ernest Migranov on 04.09.2021.
//

import Foundation
import UIKit

class DescriptionViewController: UIViewController{
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 21)
        return label
    }()
    
    lazy var descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.gray
        return label
    }()
    
    let timeLabel = UILabel()
    let imageLabel = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.view.addSubview(titleLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(timeLabel)
        self.view.addSubview(imageLabel)
        
        setConstraints()
        
    }

    func setConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            imageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20),
            imageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: imageLabel.bottomAnchor,constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            timeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 20),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            
        ])
    }
}
