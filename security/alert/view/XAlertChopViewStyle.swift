//
//  XAlertChopViewStyle.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 03.08.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//

import Foundation
import UIKit

struct XAlertChopViewStyle {
    struct Lable {
        let font: UIFont?
        let color: UIColor
        var alignment: NSTextAlignment = .center
    }
    
    let backgroundColor: UIColor
    let title: Lable
    let text: Lable?
    let num: Lable
    let mail: Lable
    var buttonOrientation: CTFontOrientation = .vertical
    let positive: XZoomButton.Style
    let site: XZoomButton.Style
    let negative: XZoomButton.Style?
}
extension XAlertChopView {
    typealias chopStyle = XAlertChopViewStyle
}

