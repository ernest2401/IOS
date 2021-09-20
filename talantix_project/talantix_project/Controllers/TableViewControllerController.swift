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
    
    lazy var cachedDatasource : NSCache<AnyObject, UIImage> = {
        let cache = NSCache<AnyObject, UIImage>()
        
        return cache
    }()
    
    let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=fe6fae94830eb609a377b3b354612720&language=ru"
    
    let imageString = "https://image.tmdb.org/t/p/w500/"
    
    let date = NSDate.now

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Список картинок"
        self.view.addSubview(table)
        let title = UILabel()

        title.textColor = .black

        setupTableView()
        setConstraints()
        
        networkService.request(urlString: urlString) { [weak self] searchResponse, error in
            searchResponse?.results.map({ (ad) in
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
        return searchResponse?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as? TableViewCell
        let post = searchResponse?.results[indexPath.row]
        cell?.titleLabel.text = post?.original_title
        
        if let image = cachedDatasource.object(forKey: indexPath.row as AnyObject)
        {
            cell?.imageLabel.image = image
        }
        else{
            let imageMain = imageString + post!.backdrop_path
            
            cell?.imageLabel.image = UIImage(data: try! Data(contentsOf: URL(string: imageMain)!))
            cachedDatasource.setObject(UIImage(data: try! Data(contentsOf: URL(string: imageMain)!))!, forKey: indexPath.row as AnyObject)
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let vc = DescriptionViewController()
        let post = searchResponse?.results[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        vc.titleLabel.text = post?.original_title
        let imageMain = imageString + post!.backdrop_path
        vc.imageLabel.image = UIImage(data: try! Data(contentsOf: URL(string: imageMain)!))
        vc.descriptionLabel.text = generateCurrentTimeStamp()
        
    }
    
    func generateCurrentTimeStamp () -> String {
        let formatter = DateFormatter()
        let text = "Фото загружено в "
        formatter.dateFormat = "\(text)HH:mm"
        return (formatter.string(from: Date()) as NSString) as String
    }
}


