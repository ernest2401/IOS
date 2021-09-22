//
//  SearchResponse.swift
//  twitch
//
//  Created by Ernest Migranov on 03.09.2021.
//

import Foundation
import UIKit

struct SearchResponse: Decodable{
    var currently: Day = Day()
    var timezone: String
}

struct Day: Decodable{
    var temperature: Double = 0.0
    var summary: String = ""
    var icon: String = ""
}

