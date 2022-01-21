//
//  ArticlesPresenter.swift
//  Clean Swift
//
//  Created by Ernest Migranov on 19.01.2022.
//

import Foundation

protocol ArticlesPresentationLogic{
    func present(data: [ArticleBackendModel])
}

class ArticlesPresenter{
    
    weak var viewController: ArticlesDisplayLogic?
    
}

extension ArticlesPresenter: ArticlesPresentationLogic{
    func present(data: [ArticleBackendModel]) {
        
        let viewModel = data.map { model -> ArticleCellModel in
            let cellModel = ArticleCellModel(articleId:model.articleId,
                                             titleText: model.name,
                                             bodyText: model.text)
            return cellModel
        }
        
        viewController?.display(data: viewModel)
    }
    
}
