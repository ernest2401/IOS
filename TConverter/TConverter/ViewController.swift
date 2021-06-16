//
//  ViewController.swift
//  TConverter
//
//  Created by Ernest Migranov on 16.04.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var farenheitLabel: UILabel!
    @IBOutlet weak var slider: UISlider!{
        didSet{
            slider.maximumValue = 100
            slider.minimumValue = 0
            slider.value = 0
        }
    }

    @IBAction func sliderChange(_ sender: UISlider) {
        let temperatureCelsius = Int(round(sender.value))
        celsiusLabel.text = "\(temperatureCelsius)ºC"
        let farenheitTemperature = Int(round((sender.value * 9 / 5) + 32))
        farenheitLabel.text = "\(farenheitTemperature)ºF"
        
    }
}

