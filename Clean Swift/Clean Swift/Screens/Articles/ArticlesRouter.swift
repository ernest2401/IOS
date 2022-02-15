//
//  ArticlesRouter.swift
//  Clean Swift
//
//  Created by Ernest Migranov on 19.01.2022.
//

import Foundation
import UIKit

protocol ArticlesRoutingLogic{
    func navigateToDetails(articleId: Int,imageBool: Bool)
}

class ArticlesRouter{

    //var datastore: //от протокол
    weak var viewController: UIViewController?

}

extension ArticlesRouter: ArticlesRoutingLogic{
    func navigateToDetails(articleId: Int,imageBool: Bool) {
        let vc = ArticleDetailsViewController()
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
        vc.router?.dataStore?.articleId = articleId
        vc.router?.dataStore?.imageBool = imageBool
    }
}
