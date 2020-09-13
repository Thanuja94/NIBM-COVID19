//
//  MapViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: - Properties
    
    private let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()

        
    }
    
    func setupUi() {
        
        view.addSubview(mapView)
        mapView.frame = view.frame
    }
  
}
