//
//  XChopController.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 02.08.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//

import Foundation
import UIKit

class XChopController: XBaseViewController<XChopView>,XChopMainViewDelegate{
    
    var mailString: String = ""
    var numberString: String = ""
    
    override func viewDidLoad(){
        super.viewDidLoad()
        title = "Охранные компании"
        navigationBarStyle(xNavigationBarStyle())
        mainView.delegate = self
    }
    func showAlert(name: String,adres: String,num: String,mail: String){
        mailString = mail
        numberString = num
        let alert = XAlertChopController(
            style: baseAlertStyle(),
            strings: rejectAlertStrings(name: name,adres: adres,num: num,mail: mail),
            positive: pos,
            site: site,
            negative: nil
        )
        navigationController?.present(alert, animated: true)
    }
    func pos(){
        guard let url = URL(string: "telprompt://\(numberString)"), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
        print("Звонок")
        return
    }
    func site(){
        guard let url = URL(string: "mailto://\(mailString)"), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
        print("Mail")
        return
    }
}
