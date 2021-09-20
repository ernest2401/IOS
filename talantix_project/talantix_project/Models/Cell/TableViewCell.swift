//
//  TableViewCell.swift
//  twitch
//
//  Created by Ernest Migranov on 03.09.2021.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell{
    
    let imageLabel = UIImageView()
    let titleLabel = UILabel()
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = UIColor.gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imageLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        setConstraints()
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    func setConstraints(){
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            imageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -240),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: imageLabel.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageLabel.trailingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}
