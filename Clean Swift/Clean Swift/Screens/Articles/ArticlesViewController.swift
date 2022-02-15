//
//  ArticleViewController.swift
//  Clean Swift
//
//  Created by Ernest Migranov on 18.01.2022.
//

import UIKit

protocol ArticlesDisplayLogic: class {
    func display(data: [ArticleCellModel])
}

class ArticlesViewController: UIViewController {
    
    private var table = UITableView()
    
    var interactor: ArticlesBusinessLogic?
    private var dataToDisplay = [ArticleCellModel]()
    var router: ArticlesRoutingLogic?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setConstraints()
        interactor?.fetchArticles()

    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
}

extension ArticlesViewController: ArticlesDisplayLogic{
    func display(data: [ArticleCellModel]) {
        //dataToDisplay.removeAll()
        dataToDisplay.append(contentsOf: data)
        table.reloadData()
    }
    
}

extension ArticlesViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as? ArticleCell
            else { return UITableViewCell() }
        cell.setup(data: dataToDisplay[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.router?.navigateToDetails(articleId: dataToDisplay[indexPath.row].articleId,imageBool: dataToDisplay[indexPath.row].imageBool)
    }
    
    private func setupTableView(){
        table.register(ArticleCell.self,forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        table.tableFooterView = UIView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(table)
    }
    
    
}

