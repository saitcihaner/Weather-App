//
//  ViewController.swift
//  test
//
//  Created by Sait Cihaner on 18.02.2022.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var isLoadingView: UIActivityIndicatorView!
    var weatherViewModel : WeatherViewModel?
    var alertViewModel:AlertViewModel?
    @IBOutlet weak var mapkitView: MKMapView!
    let annotation = MKPointAnnotation.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoadingView.isHidden = true
        alertViewModel = AlertViewModel.init()
        weatherViewModel = WeatherViewModel.init()
        weatherViewModel?.delegate = self
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(self.convertLocation(_ :)))
        mapkitView.addGestureRecognizer(gesture)
        
    }

    
    @objc func convertLocation(_ sender : UIGestureRecognizer ){
        let touchedLocation = sender.location(in: mapkitView)
        let locationCoordinate = self.mapkitView.convert(touchedLocation, toCoordinateFrom: mapkitView)
        
        weatherViewModel?.getWeatherInformation(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
        isLoadingView.isHidden = false
        isLoadingView.startAnimating()
        
        
    }
    

}

extension ViewController:WeatherApiProtocol{
    func weatherApi(response: Response?, errorMessage: String?) {
        isLoadingView.stopAnimating()
        isLoadingView.hidesWhenStopped = true
        
        if let response = response {
        let alert =  alertViewModel?.createAlert(message: "You are located in \(response.name ?? "") and weather is going to be \(response.weather?[0].main ?? "") today", alertType: .success)
            
            annotation.coordinate = CLLocationCoordinate2D.init(latitude: (response.coord?.lat)!, longitude: (response.coord?.lon)!)
            annotation.title = response.name
            mapkitView.addAnnotation(annotation)
            present(alert!, animated: true, completion: nil)
            return
        
            
        }
        let alert =  alertViewModel?.createAlert(message: "Sistemsel sıkıntıdan dolayı şu an hizmet veremiyoruz.Lütfen daha sonra tekrar deneyiniz" ,alertType: .failure )
        present(alert!, animated: true, completion: nil)
        
    }
    
}
