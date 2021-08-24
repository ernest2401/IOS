//
//  XPersonAgreementController.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 21.07.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//
import UIKit

class XPersonAgreementController: XBaseViewController<XPersonAgreementView> {
    
    let strings = XPersonAgreementViewStrings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = strings.navigationBarTitle
        navigationBarStyle(xNavigationBarStyle())
        
    }
    
}

