//
//  ProfileViewController.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 11.10.2023.
//

import UIKit
import MapKit
import SCLAlertView

class ProfileViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let arr:[Dictionary<String, Any>] = [
        ["title": "İşletme -1", "detail": "İşletme -1 Detail", "lat": 41.028780, "long": 28.986365],
        ["title": "İşletme -2", "detail": "İşletme -2 Detail", "lat": 41.033780, "long": 28.981365]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UserDefaults.standard.setValue(2, forKey: "index")
        locationPars()
        
        let lat:CLLocationDegrees = arr[0]["lat"] as! CLLocationDegrees
        let long:CLLocationDegrees = arr[0]["long"] as! CLLocationDegrees
        mapZoom(lat: lat, long: long)
    }
    
    func locationPars() {
        for item in arr {
            let pin = MKPointAnnotation()
            pin.coordinate.latitude = item["lat"] as! CLLocationDegrees
            pin.coordinate.longitude = item["long"] as! CLLocationDegrees
            pin.title = (item["title"] as? String)!
            pin.subtitle = (item["detail"] as? String)!
            self.mapView.addAnnotation(pin)
        }
    }
    
    func mapZoom(lat: CLLocationDegrees, long: CLLocationDegrees ) {
        let latDelta:CLLocationDegrees = 0.05
        let logDelta:CLLocationDegrees = 0.05
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: logDelta)
        let center = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let ragion = MKCoordinateRegion(center: center, span: span)
        self.mapView.setRegion(ragion, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let lat = view.annotation?.coordinate.latitude
        let long = view.annotation?.coordinate.longitude
        mapZoom(lat: lat!, long: long!)
        SCLAlertView().showInfo(view.annotation!.title!!, subTitle: view.annotation!.subtitle!!)
    }


}
