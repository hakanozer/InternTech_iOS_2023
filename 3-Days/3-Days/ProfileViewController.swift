//
//  ProfileViewController.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 11.10.2023.
//

import UIKit
import MapKit

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
    }
    


}
