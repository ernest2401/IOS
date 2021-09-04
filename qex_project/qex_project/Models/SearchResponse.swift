//
//  SearchResponse.swift
//  twitch
//
//  Created by Ernest Migranov on 03.09.2021.
//

import Foundation

struct SearchResponse: Decodable{
    var posts: [Post]
    
}

struct Post: Decodable {
    var name: String
    var description: String
    var photo: String
    var created_at: String
}

