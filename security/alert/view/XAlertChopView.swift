//
//  XAlertChopView.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 02.08.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//

import Foundation
import UIKit

class XAlertChopView: UIView {
    public var delegate: XAlertChopViewDelegate?
    
    private let titleView = UILabel()
    private let textView = UILabel()
    private let numView = UILabel()
    private let mailView = UILabel()
    private var positiveView, siteView, negativeView: XZoomButton!
    
    public func build(style: chopStyle, strings: chopStrings) {
        initViews(style: style, strings: strings)
        setConstraints(style: style, strings: strings)
    }
    
    private func initViews(style: chopStyle, strings: chopStrings) {
        backgroundColor = style.backgroundColor
        
        titleView.numberOfLines = 0
        titleView.text = strings.title
        titleView.font = style.title.font
        titleView.textColor = style.title.color
        titleView.textAlignment = style.title.alignment
        addSubview(titleView)
        
        textView.numberOfLines = 0
        if let style = style.text {
            textView.text = strings.text
            textView.font = style.font
            textView.textColor = style.color
            textView.textAlignment = style.alignment
        }
        addSubview(textView)
        numView.text = strings.num
        numView.font = style.num.font
        numView.textColor = style.num.color
        numView.textAlignment = style.num.alignment
        addSubview(numView)
        
        mailView.text = strings.mail
        mailView.font = style.mail.font
        mailView.textColor = style.num.color
        mailView.textAlignment = style.num.alignment
        addSubview(mailView)
        
        positiveView = XZoomButton(style: style.positive)
        positiveView.text = strings.positive
        positiveView.addTarget(self, action: #selector(positiveViewTapped), for: .touchUpInside)
        addSubview(positiveView)
        
        siteView = XZoomButton(style: style.site)
        siteView.text = strings.site
        siteView.addTarget(self, action: #selector(positiveViewTapped), for: .touchUpInside)
        addSubview(siteView)

        negativeView = XZoomButton(style: style.negative ?? style.positive)
        negativeView.text = strings.negative ?? strings.positive
        negativeView.addTarget(self, action: #selector(negativeViewTapped), for: .touchUpInside)
        if (strings.negative == nil) { negativeView.isHidden = true }
        addSubview(negativeView)
    }
    
    private func setConstraints(style: chopStyle, strings: chopStrings) {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        numView.translatesAutoresizingMaskIntoConstraints = false
        mailView.translatesAutoresizingMaskIntoConstraints = false
        siteView.translatesAutoresizingMaskIntoConstraints = false
        positiveView.translatesAutoresizingMaskIntoConstraints = false
        negativeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            titleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            titleView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),

            textView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            textView.centerXAnchor.constraint(equalTo: centerXAnchor),
            textView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            textView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            
            numView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10),
            numView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            numView.centerXAnchor.constraint(equalTo: centerXAnchor),
            numView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            numView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            
            mailView.topAnchor.constraint(equalTo: numView.bottomAnchor,constant: 10),
            mailView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            mailView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mailView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            mailView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            
            
        ])
        if (strings.text == nil) { numView.heightAnchor.constraint(equalToConstant: 0).isActive = true }
        if (style.buttonOrientation == .horizontal) {
            NSLayoutConstraint.activate([
                positiveView.topAnchor.constraint(equalTo: mailView.bottomAnchor, constant: 20),
                positiveView.heightAnchor.constraint(equalToConstant: 40),
                positiveView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
                positiveView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            ])
            if ( strings.negative == nil ) {
                positiveView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor).isActive = true
                positiveView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            } else {
                NSLayoutConstraint.activate([
                    negativeView.topAnchor.constraint(equalTo: mailView.bottomAnchor, constant: 20),
                    negativeView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
                    negativeView.heightAnchor.constraint(equalToConstant: 40),
                    negativeView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
                    negativeView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                                                
                    positiveView.leadingAnchor.constraint(equalTo: negativeView.trailingAnchor),
                    positiveView.widthAnchor.constraint(equalTo: negativeView.widthAnchor)
                ])
            }
        } else {
            NSLayoutConstraint.activate([
                positiveView.topAnchor.constraint(equalTo: mailView.bottomAnchor, constant: 20),
                positiveView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
                positiveView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
                negativeView.heightAnchor.constraint(equalToConstant: 40),
                positiveView.widthAnchor.constraint(equalTo: widthAnchor),
            ])
            if ( strings.negative != nil ) {
                NSLayoutConstraint.activate([
                    //siteView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
                    siteView.topAnchor.constraint(equalTo: positiveView.bottomAnchor,constant: 6),
                    siteView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
                    siteView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
                    siteView.heightAnchor.constraint(equalToConstant: 40),
                    siteView.widthAnchor.constraint(equalTo: widthAnchor),
                    negativeView.topAnchor.constraint(equalTo: siteView.bottomAnchor, constant: 6),
                    negativeView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
                    negativeView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
                    negativeView.heightAnchor.constraint(equalToConstant: 40),
                    negativeView.widthAnchor.constraint(equalTo: widthAnchor),
                    negativeView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
                    
                    
                ])
            } else {
                positiveView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
            }
        }
    }
    
    @objc private func positiveViewTapped() { delegate?.XAlertViewPositiveButtonTapped() }
    
    @objc private func siteViewTapped() { delegate?.XAlertViewSiteButtonTapped() }
    
    @objc private func negativeViewTapped() { delegate?.XAlertViewNegativeButtonTapped() }
}


