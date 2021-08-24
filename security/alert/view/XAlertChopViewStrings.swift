//
//  XAlertChopViewStrings.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 03.08.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//

import Foundation
import UIKit

struct XAlertChopViewStrings {
    let title: String
    let text: String?
    let num: String
    let mail: String
    let positive: String
    let site: String
    let negative: String?
}

extension XAlertChopView {
    typealias chopStrings = XAlertChopViewStrings
}
