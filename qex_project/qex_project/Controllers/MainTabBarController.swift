//
//  ViewController.swift
//  twitch
//
//  Created by Ernest Migranov on 03.09.2021.
//

import UIKit

class MainTabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar(){
        let tableViewController = createNavController(vc: TableViewController())
        viewControllers = [tableViewController]
    }
   
    func createNavController(vc: UIViewController) -> UINavigationController{
        let navController = UINavigationController(rootViewController: vc)
        return navController
    }
}



