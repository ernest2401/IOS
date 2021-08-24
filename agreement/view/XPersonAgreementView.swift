//
//  XPersonAgreementView.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 22.07.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//

import Foundation
import UIKit

class XPersonAgreementView: UIView{
    
    override init(frame: CGRect){
        super.init(frame: frame)//зачем?
        initViews()
        scroll()
        setConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    public let strings = XPersonAgreementViewStrings()
    
    public var textView: UITextView!
    
    public func initViews(){
        textView = UITextView()
        let attributedNotes = NSMutableAttributedString(string: strings.textAgreement)
        textView.font = style().text.font
        attributedNotes.addAttribute(NSAttributedString.Key.font, value: style().title.font, range: NSRange(location: 0, length: 24))
        textView.attributedText = attributedNotes
        
        textView.textColor = style().text.color
        addSubview(textView)
    }
    
    private func setConstraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            textView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            textView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 35)
        ])
    }
    
    func scroll() {
        textView.scrollRangeToVisible(NSMakeRange(-50, 100))
    }
}
