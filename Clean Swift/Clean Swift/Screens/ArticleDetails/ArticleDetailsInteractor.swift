//
//  ArticleDetailsInteractor.swift
//  Clean Swift
//
//  Created by Ernest Migranov on 19.01.2022.
//

import Foundation

protocol ArticleDetailsBusinessLogic{
    func fetchDetails()
}

protocol ArticleDetailsStoreProtocol: class {
    var articleId: Int { get set}
}

class ArticleDetailsInteractor: ArticleDetailsStoreProtocol{
    var articleId: Int = -1
}

extension ArticleDetailsInteractor: ArticleDetailsBusinessLogic{
    func fetchDetails() {
        print(articleId)
    }
    
    
}
