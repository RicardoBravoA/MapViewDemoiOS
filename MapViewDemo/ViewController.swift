//
//  ViewController.swift
//  MapViewDemo
//
//  Created by Ricardo Bravo Acuña on 12/06/16.
//  Copyright © 2016 Ricardo Bravo Acuña. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitude:CLLocationDegrees = -12.120952
        let longitude:CLLocationDegrees = -77.031039
        
        let latDelta:CLLocationDegrees = 0.1
        let lonDelta:CLLocationDegrees = 0.1
        
        let visibleArea:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let regionVisible:MKCoordinateRegion = MKCoordinateRegionMake(location, visibleArea)
        mapView.setRegion(regionVisible, animated: true)
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "I'm title"
        annotation.subtitle = "I'm subtitle"
        mapView.addAnnotation(annotation)
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.gestureDetected(_:)))
        gesture.minimumPressDuration = 1
        mapView.addGestureRecognizer(gesture)
        
    }
    
    func gestureDetected (gesture: UIGestureRecognizer){
        let touchPoint = gesture.locationInView(self.mapView)
        let coordinate:CLLocationCoordinate2D = self.mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "I'm title"
        annotation.subtitle = "I'm subtitle"
        mapView.addAnnotation(annotation)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

