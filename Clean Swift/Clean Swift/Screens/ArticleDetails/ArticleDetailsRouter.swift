//
//  ArticleDetailsRouter.swift
//  Clean Swift
//
//  Created by Ernest Migranov on 19.01.2022.
//

import Foundation

protocol ArticleDetailsDataPassingProtocol{
    var dataStore: ArticleDetailsStoreProtocol? { get }
}

class ArticleDetailsRouter: ArticleDetailsDataPassingProtocol{
    var dataStore: ArticleDetailsStoreProtocol?
    
    
}


