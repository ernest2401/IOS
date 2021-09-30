//
//  NavigationBar.swift
//  Epilier
//
//  Created by Ernest Migranov on 30.09.2021.
//

import Foundation
import UIKit

extension UIViewController {
    func hideNavigationBar(animated: Bool){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    
}
