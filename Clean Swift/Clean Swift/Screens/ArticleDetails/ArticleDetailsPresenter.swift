//
//  ArticleDetailsPresenter.swift
//  Clean Swift
//
//  Created by Ernest Migranov on 26.01.2022.
//

import Foundation

protocol ArticleDetailsPresenterProtocol{
    func present(data: Int,image: Bool)
}

class ArticleDetailsPresenter{
    
    weak var viewController: ArticleDetailsDisplayLogic?
}

extension ArticleDetailsPresenter: ArticleDetailsPresenterProtocol{
    func present(data: Int,image: Bool) {
        if image == true{
            viewController?.displayWithImage(data: data,image: image)
        } else {
            viewController?.displayWithoutImage(data: data,image: image)
        }
    }
    
    
}
