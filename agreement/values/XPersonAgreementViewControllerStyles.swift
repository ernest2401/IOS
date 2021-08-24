//
//  XPersonAgreementViewControllerStyles.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 26.07.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//

import Foundation
import UIKit

extension XPersonAgreementController{
    func xNavigationBarStyle() -> XAboutController.NavigationBarStyle {
        return XAboutController.NavigationBarStyle (
            backgroundColor: UIColor.white,
            left: XAboutController.NavigationBarStyle.LeftButton(
                iconName: "ic_stair",
                color: UIColor(red: 0x41/255, green: 0x40/255, blue: 0x42/255, alpha: 1)
            ),
            title: XAboutController.NavigationBarStyle.Title(
                font: UIFont(name: "Open Sans", size: 20),
                alignment: .left,
                color: UIColor(red: 0x41/255, green: 0x40/255, blue: 0x42/255, alpha: 1)
            )
        )
    }
}
