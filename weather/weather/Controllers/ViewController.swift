//
//  ViewController.swift
//  weather
//
//  Created by Ernest Migranov on 20.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var degreeLabel: UILabel!
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    let networkService = NetworkService()
    var searchResponse: SearchResponse? = nil
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        button1.addTarget(self, action: #selector(holdButton1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(holdButton2), for: .touchUpInside)
        
    }
    
    func sendRequest(location: String){
        let baseURL = "https://api.darksky.net/forecast/3e7e519ea86c8e3fcf67c0f4870513d7/"
        let urlString = baseURL + location
        networkService.request(urlString: urlString) { [weak self] searchResponse, error in
            self!.updateView(temperature: (searchResponse?.currently.temperature)!,summary: (searchResponse?.currently.summary)!,icon: (searchResponse?.currently.icon)!)
        }
    }
    
    func updateView(temperature:Double,summary: String,icon: String){
        let celcius = Int((temperature - 32) * 5/9)
        degreeLabel.text = "\(String(celcius))°C"
        weatherLabel.text = summary
        print(icon)
        weatherImage.image = UIImage(named:icon)
    }
    
    @objc func holdButton1()
    {
        sendRequest(location: "59.950015,%2030.316599")
        
        button1.backgroundColor = .black
        button2.backgroundColor = .white
    }
    
    @objc func holdButton2()
    {
        sendRequest(location: "55.753913,%37.620836")
        button1.backgroundColor = .white
        button2.backgroundColor = .black
    }
    
    
}


