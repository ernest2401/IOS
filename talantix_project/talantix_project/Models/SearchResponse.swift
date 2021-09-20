//
//  SearchResponse.swift
//  twitch
//
//  Created by Ernest Migranov on 03.09.2021.
//

import Foundation

struct SearchResponse: Decodable{
    var page: Int
    var results: [Post]
}

struct Post: Decodable {
    var original_title: String
    var backdrop_path: String
}

