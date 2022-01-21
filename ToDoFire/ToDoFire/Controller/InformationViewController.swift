//
//  InformationViewController.swift
//  ToDoFire
//
//  Created by Ernest Migranov on 20.10.2021.
//

import UIKit
import Firebase

class InformationViewController: UIViewController {
    
    var user: User!
    var ref: DatabaseReference!
    var tasks = Array<Task>()
    
    let profilePhoto = UIImageView(image: UIImage(named: "profilePhoto"))
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Альберт Вагманов"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    let gradeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Степень: студент"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    let courseLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Курс по выбору: DML"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    let button: UIButton = {
        var item = UIButton()
        item.setTitle("Добавить информацию", for: .normal)
        item.translatesAutoresizingMaskIntoConstraints = false
        item.addTarget(self, action: #selector(informationFunc), for: .touchUpInside)
        return item
    }()
    
    let buttonPhoto: UIButton = {
        var item = UIButton()
        item.setTitle("Добавить фотографию", for: .normal)
        item.translatesAutoresizingMaskIntoConstraints = false
        item.addTarget(self, action: #selector(photoFunc), for: .touchUpInside)
        return item
    }()
    
    let githubLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ссылка на github: github.com/albert_vagmanov"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    let youtubeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ссылка на youtube: youtube.com/alba_300"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        self.view.addSubview(profilePhoto)
        self.view.addSubview(nameLabel)
        self.view.addSubview(gradeLabel)
        self.view.addSubview(courseLabel)
        self.view.addSubview(button)
        self.view.addSubview(buttonPhoto)
        self.view.addSubview(githubLabel)
        self.view.addSubview(youtubeLabel)
        
        setConstraints()
        guard let currentUser = Firebase.Auth.auth().currentUser else {
            return
        }
        user = User(user: currentUser)
        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("tasks")
    }
    
    func setConstraints(){
        profilePhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profilePhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            profilePhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePhoto.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.2),
            profilePhoto.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.1),
            nameLabel.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            gradeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            gradeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            courseLabel.topAnchor.constraint(equalTo: gradeLabel.bottomAnchor, constant: 20),
            courseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.topAnchor.constraint(equalTo: courseLabel.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonPhoto.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            buttonPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            githubLabel.topAnchor.constraint(equalTo: buttonPhoto.bottomAnchor, constant: 20),
            githubLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            youtubeLabel.topAnchor.constraint(equalTo: githubLabel.bottomAnchor, constant: 20),
            youtubeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ])
        
    }
    
    @objc func photoFunc(){
        let alertController = UIAlertController(title: "Добавьте фотографию", message: "Добавить url", preferredStyle: .alert)
        alertController.addTextField()
        let save = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            guard let textField = alertController.textFields?.first, textField.text != "" else { return }
            let url = URL(string:textField.text!)
                if let data = try? Data(contentsOf: url!)
                {
                    self!.profilePhoto.image = UIImage(data: data)
                }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(save)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)

    }
    
    @objc func informationFunc(){
        self.present(RegisterViewController(), animated: true, completion: nil)
    }

}


