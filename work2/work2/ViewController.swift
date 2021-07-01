//
//  ViewController.swift
//  work2
//
//  Created by Ernest Migranov on 29.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.isHidden = true
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        for family: String in UIFont.familyNames
             {
                 print("\(family)")
                 for names: String in UIFont.fontNames(forFamilyName: family)
                 {
                        print("== \(names)")
                 }
             }
        
        
    }

    @IBOutlet weak var label1: UILabel!
    
    
    
    func animateIn(){
        //print(popUpView.isHidden)
        self.view.addSubview(popUpView)
        //popUpView.center = self.view.center
        
        popUpView.frame.origin.y = screenHeight - 265
        popUpView.frame.size.width = screenWidth
        
        popUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popUpView.alpha = 0
        
        //self.visualEffectView.backgroundColor = UIColor.gray.withAlphaComponent(0.9)
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.effect = self.effect
            self.popUpView.alpha = 1
            self.popUpView.transform = CGAffineTransform.identity
            
        }
        
    }

    
    @IBAction func button(_ sender: UIButton) {
        if popUpView.isHidden == false{
            popUpView.isHidden = true
        } else {
            animateIn()
            popUpView.isHidden = false
        }
    }
    
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    @IBOutlet weak var popUpView: UIView!
}

