//
//  ArticleAssembly.swift
//  Clean Swift
//
//  Created by Ernest Migranov on 26.01.2022.
//

import Foundation
import UIKit

final class ArticleAssembly {
    static func create() -> UIViewController{
        let viewController = ArticlesViewController()
        let presenter = ArticlesPresenter()
        let interactor = ArticlesInteractor()
        let router = ArticlesRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        router.viewController = viewController
        viewController.router = router
        //router.datastore = interactor
        
        return viewController
    }
}
