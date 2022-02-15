//
//  ArticleDetailsViewController.swift
//  Clean Swift
//
//  Created by Ernest Migranov on 19.01.2022.
//

import UIKit

protocol ArticleDetailsDisplayLogic: class {
    func displayWithImage(data: Int,image: Bool)
    func displayWithoutImage(data:Int,image:Bool)
}

class ArticleDetailsViewController: UIViewController {
    
    private(set) var router: ArticleDetailsDataPassingProtocol?
    
    private var interactor: (ArticleDetailsBusinessLogic & ArticleDetailsStoreProtocol)?
    
    lazy var label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vasya"
        return label
    }()
    
    lazy var image: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        //image.image = UIImage(named: "apple")
        return image
    }()
    
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
        let presenter = ArticleDetailsPresenter()
        let router = ArticleDetailsRouter()
        router.dataStore = interactor
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        interactor?.fetchDetails()
        setView()
    }
    
    func setView(){
        self.view.addSubview(label)
        self.view.addSubview(image)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            image.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3)
        ])
    }
    

}

extension ArticleDetailsViewController: ArticleDetailsDisplayLogic{
    func displayWithoutImage(data: Int, image: Bool) {
        self.label.text = String(data)
        
    }
    
    func displayWithImage(data: Int,image: Bool) {
        self.label.text = String(data)
        self.image.image = UIImage(named: "apple")
    }
    
    
}
