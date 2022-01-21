//
//  RegisterViewController.swift
//  ToDoFire
//
//  Created by Ernest Migranov on 20.10.2021.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var user: User!
    var ref: DatabaseReference!
    var profiles = Array<Profile>()
    
    lazy var nameLabel = UITextField()
    lazy var courseLabel = UITextField()
    lazy var gradeLabel = UITextField()
    
    lazy var verticalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            nameLabel,
            courseLabel,
            gradeLabel,
        ])
        sv.axis = .vertical
        sv.spacing = 20
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    var registerbutton: UIButton = {
        var item = UIButton()
        item.layer.cornerRadius = 10
        item.translatesAutoresizingMaskIntoConstraints = false
        //button.setImage(UIImage(named: "reviewsButton"), for: .normal)
        item.backgroundColor = UIColor.white
        item.layer.shadowColor = UIColor.black.cgColor
        item.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        item.layer.shadowOpacity = 0.1
        item.layer.shadowRadius = 10
        item.contentMode = .scaleAspectFit
        item.addTarget(self, action: #selector(registerFunc), for: .touchUpInside)
        item.setTitle("Зарегистрироваться", for: .normal)
        item.setTitleColor(.black, for: .normal)
        return item
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let currentUser = Firebase.Auth.auth().currentUser else {
            return
        }
        user = User(user: currentUser)
        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("tasks")
        view.backgroundColor = .white
        view.addSubview(verticalStackView)
        view.addSubview(registerbutton)
        creatingButtons()
        setConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    func creatingButtons(){
        nameLabel.placeholder = "Введите имя:"
        courseLabel.placeholder = "Введите курс:"
        gradeLabel.placeholder = "Введите ваш статус:"
        let massive = [nameLabel,courseLabel,gradeLabel]
        for item in massive{
            //item.layer.masksToBounds = true
            item.layer.cornerRadius = 10
            item.translatesAutoresizingMaskIntoConstraints = false
            //button.setImage(UIImage(named: "reviewsButton"), for: .normal)
            item.backgroundColor = UIColor.white
            item.layer.shadowColor = UIColor.black.cgColor
            item.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            item.layer.shadowOpacity = 0.1
            item.layer.shadowRadius = 10
            item.contentMode = .scaleAspectFit
        }
    }
    
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 115),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450),
            registerbutton.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 30),
            registerbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func registerFunc(){
//        guard let textField = alertController.textFields?.first, textField.text != "" else { return }
//        let task = Task(title: textField.text!, userId: (self?.user.uid)!)
//        let taskRef = self?.ref.child(task.title.lowercased())
//        taskRef?.setValue(task.convertToDictionary())
//        let profile = Profile(name: nameLabel.text!, course: courseLabel.text!, status: gradeLabel.text!, userId: (self.user.uid))
//        let profileRef = self.ref.child(profile.name.lowercased())
//        profileRef.setValue(profile.convertToDictionary)
    }
}
