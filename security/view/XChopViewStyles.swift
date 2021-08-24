//
//  XChopViewStyle.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 03.08.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//

import Foundation
import UIKit

extension XChopController{
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
    func baseAlertStyle() -> XAlertChopView.chopStyle {
        return XAlertChopView.chopStyle(
            backgroundColor: UIColor.white,
            title: XAlertChopView.chopStyle.Lable(
                font: UIFont(name: "Open Sans", size: 20),
                color: UIColor(red: 0x41/255, green: 0x40/255, blue: 0x42/255, alpha: 1)
            ),
            text: XAlertChopView.chopStyle.Lable(
                font: UIFont(name: "Open Sans", size: 14),
                color: UIColor(red: 0xbc/255, green: 0xbc/255, blue: 0xbc/255, alpha: 1)
            ),
            num: XAlertChopView.chopStyle.Lable(
                font: UIFont(name: "Open Sans", size: 14),
                color: UIColor(red: 0xbc/255, green: 0xbc/255, blue: 0xbc/255, alpha: 1)
            ),
            mail: XAlertChopView.chopStyle.Lable(font: UIFont(name: "Open Sans", size: 14), color: UIColor(red: 0xbc/255, green: 0xbc/255, blue: 0xbc/255, alpha: 1)),
            buttonOrientation: .vertical,
            positive: XZoomButton.Style (
                backgroundColor: UIColor.clear,
                font: UIFont(name: "Open Sans", size: 15.5),
                color: #colorLiteral(red: 0.3607443571, green: 0.6902247071, blue: 0.8846521974, alpha: 1)
            ),
            site: XZoomButton.Style (
                backgroundColor: UIColor.clear,
                font: UIFont(name: "Open Sans", size: 15.5),
                color: UIColor(red: 0x41/255, green: 0x40/255, blue: 0x42/255, alpha: 1)
            ),
            negative: XZoomButton.Style (
                backgroundColor: UIColor.clear,
                font: UIFont(name: "Open Sans", size: 15.5),
                color: UIColor(red: 0x41/255, green: 0x40/255, blue: 0x42/255, alpha: 1)
            )
        )
    }
}

