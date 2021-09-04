//
//  MainTabBarController.swift
//  twitch
//
//  Created by Ernest Migranov on 04.09.2021.
//

import Foundation
import UIKit

class TableViewController: UIViewController{
    let networkService = NetworkService()
    var searchResponse: SearchResponse? = nil

    var table = UITableView(frame: CGRect.zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Список объявлений"
        self.view.addSubview(table)

        setupTableView()
        setConstraints()
        
        
        let urlString = "https://scripts.qexsystems.ru/test_ios/public/api/posts"
        networkService.request(urlString: urlString) { [weak self] searchResponse, error in
            searchResponse?.posts.map({ (ad) in
                self?.searchResponse = searchResponse
                self?.table.reloadData()
            })
        }
        
    }
    
    private func setupTableView(){
        table.register(TableViewCell.self,forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        
    }
    
    func setConstraints(){
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor,constant: 0),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0),
        ])
    }
}

extension TableViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResponse?.posts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as? TableViewCell
        //let track = searchResponse?.results[indexPath.row]
        //cell?.textLabel?.text = track?.trackName
        let post = searchResponse?.posts[indexPath.row]
        cell?.titleLabel.text = post?.name
        cell?.descriptionLabel.text = post?.description
        //cell?.imageLabel.image = UIImage(named: "pizza_2")
        let imageMain = "https://scripts.qexsystems.ru/test_ios/public" + post!.photo
        
        cell?.imageLabel.image = UIImage(data: try! Data(contentsOf: URL(string: imageMain)!))
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print("Раб")
       
        let vc = DescriptionViewController()
        let post = searchResponse?.posts[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        vc.titleLabel.text = post?.name
        let imageMain = "https://scripts.qexsystems.ru/test_ios/public" + post!.photo
        vc.imageLabel.image = UIImage(data: try! Data(contentsOf: URL(string: imageMain)!))
        vc.descriptionLabel.text = post?.description
        vc.timeLabel.text = timeMaker(time: post!.created_at)
    }
    
    func timeMaker(time: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFromStr = dateFormatter.date(from: time)!
        var timeFromDate = dateFormatter.string(from: dateFromStr)
        dateFormatter.dateFormat = "'Дата создания объявления: 'dd MMMM, yyyy"
        timeFromDate = dateFormatter.string(from: dateFromStr)
        return timeFromDate
    }
}

