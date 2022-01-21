//
//  ArticlesRouter.swift
//  Clean Swift
//
//  Created by Ernest Migranov on 19.01.2022.
//

import Foundation
import UIKit

protocol ArticlesRoutingLogic{
    func navigateToDetails(articleId: Int)
}

class ArticlesRouter{
    
    weak var viewController: UIViewController?
    
}

extension ArticlesRouter: ArticlesRoutingLogic{
    func navigateToDetails(articleId: Int) {
        var vc = ArticleDetailsViewController()
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
        vc.router?.dataStore?.articleId = articleId
    }
}
