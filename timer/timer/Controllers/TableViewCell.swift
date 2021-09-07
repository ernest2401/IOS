//
//  TableViewCell.swift
//  timer
//
//  Created by Ernest Migranov on 06.09.2021.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell{
    let timeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(timeLabel)
        setConstraints()
            
        }
        
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    func setConstraints(){
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
    
}
