//
//  ViewController.swift
//  timer
//
//  Created by Ernest Migranov on 06.09.2021.
//

import Foundation
import UIKit

class MainTabBarController: UIViewController, UITextFieldDelegate {
    
    let addLabel : UIButton = {
        let label = UIButton()
        label.setTitle("Добавить", for: .normal)
        label.addTarget(self, action: #selector(action), for: UIControl.Event.touchUpInside)
        label.setTitleColor(UIColor.systemBlue, for: .normal)
        label.layer.cornerRadius = 10.0
        label.backgroundColor = .systemGray3
        return label
    }()
    
    var massiveWithSeconds: [Int] = []
    var massiveWithNames: [String] = []
    
    var nameTimer = UITextField(frame: CGRect(x: 20, y: 95, width: 250, height: 30))
    var timeInSeconds = UITextField(frame: CGRect(x: 20, y: 135, width: 250, height: 30))
    
    var timer: Timer?
    
    let navBar = CustomNavigationBar()
    var table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.setNavigationBar()
        self.view.addSubview(addLabel)
        self.view.addSubview(table)
        self.view.addSubview(nameTimer)
        self.view.addSubview(timeInSeconds)

        setupTableView()
        
        nameTimer.delegate = self
        timeInSeconds.delegate = self
        nameTimer.placeholder = "Название таймера"
        nameTimer.borderStyle = UITextField.BorderStyle.roundedRect
        nameTimer.returnKeyType = UIReturnKeyType.done
        timeInSeconds.placeholder = "Время в секундах"
        timeInSeconds.borderStyle = UITextField.BorderStyle.roundedRect
        timeInSeconds.returnKeyType = UIReturnKeyType.done

        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        setConstraints()
        
    }
    
    private func setupTableView(){
        table.register(TableViewCell.self,forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        
    }
    
    @objc func onTimerFires() {
        if massiveWithSeconds.count != 0 {
            for row in 0 ... massiveWithSeconds.count - 1{
                massiveWithSeconds[row] -= 1
                if massiveWithSeconds[row] < 0{
                    massiveWithSeconds.remove(at: row)
                }
                self.table.reloadData()
            }
        }
    }
    
    @objc func action(sender: UIButton!){
        let timeLeft = Int(timeInSeconds.text!) ?? 0
        massiveWithSeconds.append(timeLeft)
        massiveWithSeconds.sort{$0 > $1}
        massiveWithNames.append(nameTimer.text!)
        timeInSeconds.text = ""
        nameTimer.text = ""
        self.table.reloadData()
    }
    
    
    func setNavigationBar() {
        //let screenSize: CGRect = UIScreen.main.bounds
        let navItem = UINavigationItem(title: "Мульти таймер")
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    func seconds2Timestamp(intSeconds:Int)->String {
       let mins:Int = intSeconds/60
       let secs:Int = intSeconds%60

       let strTimestamp:String = ((mins<10) ? "0" : "") + String(mins) + ":" + ((secs<10) ? "0" : "") + String(secs)
       return strTimestamp
    }
    
    func setConstraints(){
        navBar.translatesAutoresizingMaskIntoConstraints = false
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        table.translatesAutoresizingMaskIntoConstraints = false
        //textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor,constant: 0),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            navBar.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100),
            addLabel.topAnchor.constraint(equalTo: navBar.topAnchor,constant: 185),
            addLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            addLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            table.topAnchor.constraint(equalTo: navBar.topAnchor,constant: 250),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0),
        ])
    }

}

extension MainTabBarController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Таймеры"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massiveWithSeconds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as? TableViewCell
        cell?.textLabel?.text = String(massiveWithNames[indexPath.row])
        cell?.timeLabel.text = seconds2Timestamp(intSeconds: massiveWithSeconds[indexPath.row])
        return cell!
    }
}
