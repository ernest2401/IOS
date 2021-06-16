//
//  ViewController.swift
//  casino
//
//  Created by Ernest Migranov on 01.06.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var picture1: UIImageView!
    
    @IBOutlet weak var picture2: UIImageView!
    
    let imageNames = ["point1","point2","point3","point4","point5","point6"]
    
    @IBAction func playGame(_ sender: UIButton) {
        let randomIndex1 = Int.random(in: 0...5)
        let randomIndex2 = Int.random(in: 0...5)
        picture1.image = UIImage(named: imageNames[randomIndex1])
        picture2.image = UIImage(named: imageNames[randomIndex2])
    }
    
}

