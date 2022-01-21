//
//  ArticlesInteractor.swift
//  Clean Swift
//
//  Created by Ernest Migranov on 19.01.2022.
//

import Foundation

protocol ArticlesBusinessLogic{
    func fetchArticles()
}

class ArticlesInteractor{
    
    var presenter: ArticlesPresentationLogic?
    
}

extension ArticlesInteractor: ArticlesBusinessLogic{
    
    func fetchArticles() {
        var backendResponse = [ArticleBackendModel]()
        backendResponse.append(ArticleBackendModel(articleId: 0, name: "Title", text: "Text...", raiting: 5, symbolCount: 1000))
        backendResponse.append(ArticleBackendModel(articleId: 1, name: "Title1", text: "Text...", raiting: 5, symbolCount: 1000))
        backendResponse.append(ArticleBackendModel(articleId: 2, name: "Title2", text: "Text...", raiting: 5, symbolCount: 1000))
        backendResponse.append(ArticleBackendModel(articleId: 3, name: "Title3", text: "Text...", raiting: 5, symbolCount: 1000))
        backendResponse.append(ArticleBackendModel(articleId: 4, name: "Title4", text: "Text...", raiting: 5, symbolCount: 1000))
        backendResponse.append(ArticleBackendModel(articleId: 5, name: "Title5", text: "Text...", raiting: 5, symbolCount: 1000))
        backendResponse.append(ArticleBackendModel(articleId: 6, name: "Title6", text: "Text...", raiting: 5, symbolCount: 1000))
        backendResponse.append(ArticleBackendModel(articleId: 7, name: "Title7", text: "Text...", raiting: 5, symbolCount: 1000))
        backendResponse.append(ArticleBackendModel(articleId: 0, name: "Title8", text: "Text...", raiting: 5, symbolCount: 1000))
        
        presenter?.present(data: backendResponse)
    }
}
