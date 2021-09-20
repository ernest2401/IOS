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
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.gray
        return label
    }()
    
    let timeLabel = UILabel()
    let imageLabel = UIImageView()
    
    let date = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.view.addSubview(titleLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(timeLabel)
        self.view.addSubview(imageLabel)
        
        setConstraints()
        print(date)
        
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
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
