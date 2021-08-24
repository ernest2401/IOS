//
//  XChopCellStyle.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 03.08.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//

import Foundation
import UIKit

struct XChopCellStyle {
    struct Title {
        let font: UIFont?
        let color: UIColor
        let margins: UIEdgeInsets
    }
    
    struct Icon {
        let color: UIColor
        let size: CGSize
        let margins: UIEdgeInsets
    }
    
    let backgroundColor: UIColor
    let selectedBackgroundColor: UIColor
    let title: Title
    let icon: Icon
}

extension XChopCell {
    typealias chopCellStyle = XChopCellStyle
}
