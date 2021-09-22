//
//  MapViewController.swift
//  weather
//
//  Created by Ernest Migranov on 21.09.2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UIGestureRecognizerDelegate {

    let locationManager = CLLocationManager()
    let networkService = NetworkService()
    
    lazy var degreeLabel : UILabel = {
        let label = UILabel()
        label.text = "Температура"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.backgroundColor = .gray
        label.isOpaque = true
        return label
    }()

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        gestureRecognizer.delegate = self
        mapView.addGestureRecognizer(gestureRecognizer)
        mapView.addSubview(degreeLabel)
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnabled()
    }
    
    @objc func handleTap(gestureReconizer: UILongPressGestureRecognizer) {

        let location = gestureReconizer.location(in: mapView)
        let coordinate = mapView.convert(location,toCoordinateFrom: mapView)

        // Add annotation:
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        let locationPoint = String(annotation.coordinate.longitude) + "," + String(annotation.coordinate.latitude)
        print(locationPoint)
        sendRequest(location: locationPoint)
        
    }
    
    func checkLocationEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            checkAutorization()
            setupManager()
        } else {
            showAlertLocation(title: "У вас выключена служба геолокации", message: "Хотите включить?", url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
        }
    }
    
    func checkAutorization(){
        switch CLLocationManager.authorizationStatus(){
        case.authorizedAlways:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case.authorizedWhenInUse:
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
    
    func setupManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func sendRequest(location: String){
        let baseURL = "https://api.darksky.net/forecast/3e7e519ea86c8e3fcf67c0f4870513d7/"
        let urlString = baseURL + location
        networkService.request(urlString: urlString) { [weak self] searchResponse, error in
            guard let temperature = searchResponse?.currently.temperature else { return }
            self?.updateView(temperature: temperature)
            
        }
    }
    
    func updateView(temperature:Double){
        let celcius = Int((temperature - 32) * 5/9)
        degreeLabel.text = "\(String(celcius))°C"
    }
    
    func setConstraints(){
        degreeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            degreeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            degreeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            
        ])
    }
}

extension MapViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate{
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
        
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAutorization()
    }
}
