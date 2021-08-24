//
//  XChopCell.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 03.08.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//

import Foundation
import UIKit

class XChopCell: UITableViewCell {

    static let cellId = "ChopCellId"
    private let view = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //selectionStyle = .none
        contentView.addSubview(iconView)
        contentView.addSubview(titleLabel)
        //contentView.addSubview(dividerView)
        
        updateConstraints()
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")}
    
    lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0, weight: UIFont.Weight.medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.colorFromHex(0x4a4a4a)
        return label
    }()
    
    override func updateConstraints() {
        iconView.snp.remakeConstraints{make in
            make.top.leading.equalToSuperview().offset(16)
            //make.bottom.equalTo(dividerView.snp.top).offset(-16)
            make.height.width.equalTo(96)
        }
        titleLabel.snp.remakeConstraints{make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalTo(iconView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
//        dividerView.snp.remakeConstraints{make in
//            make.leading.trailing.bottom.equalToSuperview()
//            make.height.equalTo(1)
//        }
        super.updateConstraints()
    }

    func setContent(img: UIImage?, name: String){
        iconView.image = img
        titleLabel.text = name
    }
    
    func setStyle(_ style: chopCellStyle) {
        backgroundColor = style.backgroundColor
        view.backgroundColor = UIColor.gray
    }
}
