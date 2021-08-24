//
//  XAlertChopController.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 02.08.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//
import Foundation
import UIKit

class XAlertChopController: XBaseAlertController<XAlertChopView> {
    override var widthAnchor: CGFloat { 0.8 }
    
    private let xAlertControllerPositiveButtonTapped: () -> ()
    
    private let xAlertControllerSiteButtonTapped: () -> ()

    private let xAlertControllerNegativeButtonTapped: (() -> ())?

    init(style: XAlertChopView.chopStyle, strings: XAlertChopView.chopStrings, positive: @escaping () ->() = {}, site: @escaping () ->() = {}, negative: (() -> ())? = nil) {
        self.xAlertControllerPositiveButtonTapped = positive
        self.xAlertControllerSiteButtonTapped = site
        self.xAlertControllerNegativeButtonTapped = negative
        super.init()
        mainView.delegate = self
        mainView.build(style: style, strings: strings)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension XAlertChopController: XAlertChopViewDelegate {
    func XAlertViewPositiveButtonTapped() {
        dismiss(animated: true) {
            self.xAlertControllerPositiveButtonTapped()
        }
    }
    func XAlertViewSiteButtonTapped(){
        dismiss(animated: true){
            self.xAlertControllerSiteButtonTapped()
        }
    }
    
    func XAlertViewNegativeButtonTapped() {
        dismiss(animated: true) {
            self.xAlertControllerNegativeButtonTapped?()
        }
    }
}
