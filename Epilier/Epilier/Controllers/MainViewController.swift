//
//  MainViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 27.09.2021.
//

import Foundation
import UIKit

class MainViewController: UIViewController{
    
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(hexString: "#C8EFF4")
        return label
    }()
    
    lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Привет, Екатерина👋"
        return label
    }()
    
    lazy var ringButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Ring"), for: .normal)
        return button
    }()
    
    let image1 = UIImageView(image: UIImage(named: "story1"))
    
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        let image1 = UIImageView(image: UIImage(named: "story1"))
        let image2 = UIImageView(image: UIImage(named: "story2"))
        let image3 = UIImageView(image: UIImage(named: "story3"))
        v.addSubview(image1)
        v.addSubview(image2)
        v.addSubview(image3)
        image1.translatesAutoresizingMaskIntoConstraints = false
        image2.translatesAutoresizingMaskIntoConstraints = false
        image3.translatesAutoresizingMaskIntoConstraints = false
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(hexString: "#C8EFF4")
        image1.leftAnchor.constraint(equalTo: v.leftAnchor, constant: 0.0).isActive = true
        image1.topAnchor.constraint(equalTo: v.topAnchor, constant: 0.0).isActive = true
        image1.rightAnchor.constraint(equalTo: v.rightAnchor, constant: -300.0).isActive = true
        image1.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 40).isActive = true
        image2.leftAnchor.constraint(equalTo: image1.rightAnchor, constant: -20.0).isActive = true
        image2.topAnchor.constraint(equalTo: v.topAnchor, constant: 0.0).isActive = true
        image2.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 40).isActive = true
        image3.leftAnchor.constraint(equalTo: image2.rightAnchor, constant: -20.0).isActive = true
        image3.topAnchor.constraint(equalTo: v.topAnchor, constant: 0.0).isActive = true
        
        image3.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 40).isActive = true
        
        return v
    }()
    
    lazy var geolocationButton: UIButton = {
        let button = UIButton()
        //button.frame.size = CGSize(width: 343, height: 56)
        button.backgroundColor = .white
        button.layer.shadowOpacity = 0.2
        button.layer.cornerRadius = 10
        //button.setTitle(, for: .normal)
        button.setTitle("Epilier на ул.Павлюхина, 25", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var signUpLabel: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("Записаться", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var serviceButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "services"), for: .normal)
        //button.backgroundColor = .gray
        return button
    }()
    
    lazy var masterButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "services"), for: .normal)
        button.addTarget(self, action: Selector("masterFunc"), for: .touchUpInside)
        return button
    }()
    
    private lazy var popupView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var againButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "services"), for: .normal)
        return button
    }()
    
    lazy var imageLocation: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "location")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var iconLocation: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            serviceButton,
            masterButton,
            againButton
        ])
        sv.axis = .horizontal
        sv.spacing = 10
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    var height: CGFloat!
    private let transition = PanelTransition()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNavigationBar(animated: false)
        adViews()
        setConstraints()
        self.view.addSubview(popupView)
        
        height = view.frame.height * 0.75
        transition.height = height
    }
    
    
    
    
    @objc func masterFunc(){
        
        let child = servicePopUpView()
        child.transitioningDelegate = transition   // 2
        child.modalPresentationStyle = .custom  // 3
        
        self.present(child, animated: true)
        
    }
    
    func adViews(){
        self.view.addSubview(topLabel)
        self.view.addSubview(geolocationButton)
        self.view.addSubview(signUpLabel)
        self.view.addSubview(serviceButton)
        self.view.addSubview(masterButton)
        self.view.addSubview(againButton)
        self.topLabel.addSubview(helloLabel)
        self.topLabel.addSubview(ringButton)
        self.view.addSubview(scrollView)
        self.view.addSubview(horizontalStackView)
        self.geolocationButton.addSubview(imageLocation)
        self.geolocationButton.addSubview(iconLocation)
    }
    
    func setConstraints(){
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        ringButton.translatesAutoresizingMaskIntoConstraints = false
        geolocationButton.translatesAutoresizingMaskIntoConstraints = false
        image1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -620),
            helloLabel.topAnchor.constraint(equalTo: topLabel.topAnchor, constant: 56),
            helloLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor, constant: 16),
            helloLabel.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor, constant: -52),
            ringButton.topAnchor.constraint(equalTo: topLabel.topAnchor, constant: 55),
            //ringButton.leadingAnchor.constraint(equalTo: helloLabel.leadingAnchor, constant: 40),
            ringButton.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor, constant: -16),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0),
            scrollView.topAnchor.constraint(equalTo: helloLabel.topAnchor, constant: 30.0),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0),
            scrollView.bottomAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: -50),
            
            geolocationButton.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: -28),
            geolocationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            geolocationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            geolocationButton.bottomAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 28),
            signUpLabel.topAnchor.constraint(equalTo: geolocationButton.bottomAnchor, constant: 25),
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signUpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            imageLocation.topAnchor.constraint(equalTo: geolocationButton.topAnchor, constant: 10),
            imageLocation.leadingAnchor.constraint(equalTo: geolocationButton.leadingAnchor, constant: 10),
            imageLocation.bottomAnchor.constraint(equalTo: geolocationButton.bottomAnchor, constant: -10),
            iconLocation.topAnchor.constraint(equalTo: geolocationButton.topAnchor, constant: 20),
            iconLocation.trailingAnchor.constraint(equalTo: geolocationButton.trailingAnchor, constant: -5),
            iconLocation.bottomAnchor.constraint(equalTo: geolocationButton.bottomAnchor, constant: -20),
            horizontalStackView.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 10),
            horizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            horizontalStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
        ])
    }
}



