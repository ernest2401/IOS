//
//  ArticleDetailsViewController.swift
//  Clean Swift
//
//  Created by Ernest Migranov on 19.01.2022.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    
    private(set) var router: ArticleDetailsDataPassingProtocol?
    
    private var interactor: (ArticleDetailsBusinessLogic & ArticleDetailsStoreProtocol)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        let viewController = self
        let interactor = ArticleDetailsInteractor()
        let router = ArticleDetailsRouter()
        router.dataStore = interactor
        viewController.interactor = interactor
        viewController.router = router
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        interactor?.fetchDetails()
    }
    

    

}
