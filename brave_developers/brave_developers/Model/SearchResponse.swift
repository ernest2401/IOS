//
//  SearchResponse.swift
//  twitch
//
//  Created by Ernest Migranov on 03.09.2021.
//

import Foundation
import UIKit

struct SearchResponse: Decodable{
    var dataseries: [Dataseries] = []
}

struct Dataseries: Decodable{
    var temp2m: Int
}

