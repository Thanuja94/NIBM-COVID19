//
//  MapViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import MapKit
import Firebase

private let annotationIdentifier = "UserAnnotation"

private enum ActionButtonConfiguration {
    case showMenu
    case dismissActionView
    
    init() {
        self = .showMenu
    }
}



class MapViewController: UIViewController {
    
    // MARK: - Properties
    
    private let mapView = MKMapView()
//    private let locationManager = CLLocationManager()
    private let locationManager = LocationHandler.shared.locationManager

    private let actionButton: UIButton = {
          let button = UIButton(type: .system)
         
          button.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
          return button
      }()
    
      private let inputActivationUIView = LocationInputActivationUIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        enableLocationServices()
        fetchUsers()

        
    }
     // MARK: - functions
    
    @objc func actionButtonPressed() {
         switch actionButtonConfig {
         case .showMenu:
             print("DEBUG: Show menu")
             break
         case .dismissActionView:
             removeAnnotationsAndOverlays()
             mapView.showAnnotations(mapView.annotations, animated: true)
             
             UIView.animate(withDuration: 0.3) {
                 self.inputActivationUIView.alpha = 1
                 self.configureActionButton(config: .showMenu)
             }
             break
         }
     }
    
    func setupUi() {
        
        view.addSubview(mapView)
        mapView.frame = view.frame
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
         navigationController?.navigationBar.isHidden = false
    }
  
    
    func fetchUsers() {
          
          guard let location = locationManager?.location else { return }
          Service.shared.fetchUsersLocation(location: location) { (user) in
              guard let coordinate = user.location?.coordinate else { return }
              let annotation = UserAnnotation(uid: user.uid, coordinate: coordinate)
              
              var userIsVisible: Bool {
                  
                  return self.mapView.annotations.contains { (annotation) -> Bool in
                      guard let userAnno = annotation as? UserAnnotation else { return false }
                      
                      if userAnno.uid == user.uid {
                          userAnno.updateAnnotationPosition(withCoordinate: coordinate)
                          return true
                      }
                      
                      return false
                  }
              }
              
              if !userIsVisible {
                  self.mapView.addAnnotation(annotation)
              }
          }
      }
}


extension MapViewController: CLLocationManagerDelegate {
    func enableLocationServices() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager?.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            locationManager?.requestAlwaysAuthorization()
        case .authorizedAlways:
            locationManager?.startUpdatingLocation()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           
       }
}


extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? UserAnnotation {
            let view = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            view.image = #imageLiteral(resourceName: "pin")
            return view
        }
        
        return nil
    }

}

