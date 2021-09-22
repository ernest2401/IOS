//
//  ViewController.swift
//  brave_developers
//
//  Created by Ernest Migranov on 22.09.2021.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    let networkService = NetworkService()
    let locationManager = CLLocationManager()
    let regionInMeters : Double = 1000
    
    lazy var degreeLabel : UILabel = {
        let label = UILabel()
        label.text = "Температура"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.backgroundColor = .gray
        label.isOpaque = true
        return label
    }()
    
    let mapView : MKMapView = {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        return mapView
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setTitle("Обновить", for: .normal)
        button.addTarget(target, action: #selector(refresh), for: .touchUpInside)
        button.backgroundColor = .gray
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        checkLocationServices()
        updateWeatherInfo(latitude: 55.755786, longitude: 37.617633)
        
    }
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAutorization()
        } else {
            showAlertLocation(title: "У вас выключена служба геолокации", message: "Хотите включить?", url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
        }
    }
    
    func checkLocationAutorization(){
        switch CLLocationManager.authorizationStatus(){
        case.authorizedAlways:
            break
        case.authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            centerViewOnLocation()
            break
        case.denied:
            showAlertLocation(title: "Вы запретили использование местоположения", message: "Хотите это изменить", url: URL(string: UIApplication.openSettingsURLString))
            break
        case .restricted:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func showAlertLocation(title: String,message: String?,url:URL?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Настройки", style: .default) { (alert) in
            if let url = url{
                UIApplication.shared.open(url, options: [:],completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        present(alert,animated: true,completion: nil)
    }
    
    func centerViewOnLocation(){
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate{
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
        
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAutorization()
    }
}

extension ViewController{
    func setConstraints(){
        view.addSubview(mapView)
        view.addSubview(degreeLabel)
        view.addSubview(button)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        degreeLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor,constant: 0),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            degreeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            degreeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
        ])
        
    }
}

extension ViewController{
    func updateWeatherInfo(latitude: Double,longitude: Double){
        let url = "https://www.7timer.info/bin/astro.php?lon=\(longitude.description)&lat=\(latitude.description)&unit=metric&output=json"
        networkService.request(urlString: url) { [weak self] searchResponse, error in
            self!.updateInfo(temperature: (searchResponse?.dataseries[0].temp2m)!)
        }
    }
    
    func updateInfo(temperature: Int){
        degreeLabel.text = "Темпаратура: \(String(temperature))°C"
    }
    
    @objc func refresh(){
        updateWeatherInfo(latitude: 55.755786, longitude: 37.617633)
        print("Обновлено")
    }
}
