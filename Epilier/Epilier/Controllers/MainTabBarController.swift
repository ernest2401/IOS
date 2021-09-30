//
//  ViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 27.09.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#FFFFFF")
        setupTabBar()
            }
    
    func setTabBarItems(){
        
        let massive = ["Home","Discovery","More Square","Chat","Profile"]
        for item in 0...massive.count - 1 {
            let myTabBarItem1 = (self.tabBar.items?[item])! as UITabBarItem
            myTabBarItem1.image = UIImage(named: massive[item])?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        }
        
    }
    
    
    func setupTabBar(){
        let mainViewController = createNavController(vc: MainViewController())
        let secondViewController = SecondViewController()
        let thirdViewController = ThirdViewController()
        let fourthViewController = FourthViewController()
        let fifthViewController = FifthViewController()
        viewControllers = [mainViewController,secondViewController,thirdViewController,fourthViewController,fifthViewController]
        setupAnimation()
        
    }
    
    func setupAnimation(){
        let massive1 = ["Home","Discovery","More Square","Chat","Profile"]
        let massive2 = ["HomeOff","DiscoveryOff","More Square","ChatOff","ProfileOff"]
        
        for item in 0 ... massive1.count - 1 {
            viewControllers![item].tabBarItem.selectedImage = UIImage(named: massive1[item])
            viewControllers![item].tabBarItem.image = UIImage(named: massive2[item])
        }
    }
    
    func createNavController(vc: UIViewController) -> UINavigationController{
        let navController = UINavigationController(rootViewController: vc)
        return navController
    }
    
}

class ThirdViewController: UIViewController {
    
}
class FourthViewController: UIViewController {
    
}
class FifthViewController: UIViewController {
    
}
