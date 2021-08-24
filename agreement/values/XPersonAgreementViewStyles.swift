//
//  XPersonAgreementViewStyles.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 22.07.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//

import Foundation
import UIKit

extension XPersonAgreementView {
    func style() -> Style {
        return Style(
            backgroungColor: UIColor.white,
            text: Style.Lable(
                color: UIColor(red: 0xbc/255, green: 0xbc/255, blue: 0xbc/255, alpha: 1),
                font: UIFont(name: "Open Sans", size: 15.5)
            ),
            title: Style.Lable(
                color: UIColor(red: 0x41/255, green: 0x40/255, blue: 0x42/255, alpha: 1),
                font: UIFont(name: "Open Sans", size: 18)
            )
        )
    }
}
