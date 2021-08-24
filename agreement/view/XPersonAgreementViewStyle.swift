//
//  XPersonAgreementViewStyles.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 22.07.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//

import UIKit

struct XPersonAgreementViewStyle {
    struct Lable {
        let color: UIColor
        let font: UIFont?
    }
    
    let backgroungColor: UIColor
    let text: Lable
    let title: Lable
    
    
}
extension XPersonAgreementView {
    typealias Style = XPersonAgreementViewStyle
    
}
