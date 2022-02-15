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
    var imageBool: Bool {get set}
}

class ArticleDetailsInteractor: ArticleDetailsStoreProtocol{
    var imageBool = false
    
    var articleId: Int = -1
    
    var presenter: ArticleDetailsPresenterProtocol?
}

extension ArticleDetailsInteractor: ArticleDetailsBusinessLogic{
    func fetchDetails() {
        print(type(of: articleId))
        presenter?.present(data: articleId,image: imageBool)
    }
    
    
}
