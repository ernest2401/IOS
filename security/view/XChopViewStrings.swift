//
//  XChopViewStrings.swift
//  SecurityHub
//
//  Created by Ernest Migranov on 03.08.2021.
//  Copyright © 2021 TEKO. All rights reserved.
//

import Foundation

extension XChopController{
    func rejectAlertStrings(name: String,adres: String,num: String,mail: String) -> XAlertChopView.chopStrings {
        if num == ""{
            return XAlertChopView.chopStrings(
                title: name,
                text: adres,
                num: num,
                mail: mail,
                positive: "",
                site: "Написать",
                negative: "Перейти на сайт"
            )
        }
        if mail == ""{
            return XAlertChopView.chopStrings(
                title: name,
                text: adres,
                num: num,
                mail: mail,
                positive: "Позвонить",
                site: "",
                negative: "Перейти на сайт"
            )
        }
        return XAlertChopView.chopStrings(
            title: name,
            text: adres,
            num: num,
            mail: mail,
            positive: "Позвонить",
            site: "Написать",
            negative: "Перейти на сайт"
        )
    }
}
