//
//  ViewController.swift
//  Question2
//
//  Created by Douglas MacbookPro on 9/6/17.
//  Copyright © 2017 Douglas MacbookPro. All rights reserved.
//

import UIKit
import MapKit

var destinationLat: CLLocationDegrees = 0
var destinationLong: CLLocationDegrees = 0

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {
    
    // Create delegate to object mapKit
    @IBOutlet weak var mapKitView: MKMapView!
    @IBOutlet weak var enterDestination: UITextField!
    @IBOutlet weak var ETA: UILabel!
    @IBOutlet weak var destination: UILabel!
    
    // Triggered by Calculate ETA Button
    @IBAction func calculateETA(_ sender: UIButton) {
        // Get destination from textfield and geocodes it
        let address = enterDestination.text
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address!) { (placemark, error) in
            guard
                let placemarks = placemark, let location = placemarks.first?.location
                else{
                    return
            }
            // Gets destination's latitude and longitude
            destinationLong = location.coordinate.longitude
            destinationLat = location.coordinate.latitude
            
            // Call render map function
            // Calling this function here because it will only be called after the cordinates were gotten already, otherwise it would try to render the map before while this block of code was still being completed. This would cause the error to be thrown, since the app would not have gotten the coordinates yet. In order fo the app not to crash, I set the default destinations to 0 degrees and throw an error.
            self.renderMap()
            
            
            // Display location in bottomo layer and clear textfield
            self.destination.text = self.enterDestination.text
            self.enterDestination.text = ""
        }
        // Dismiss keyboard after "Calculate ETA" is pressed
        enterDestination.resignFirstResponder()
    }
    

    // Grab instance to location manager to request location permission
    let locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the map view and add information to it
        mapKitView.delegate = self
        mapKitView.showsScale = true
        mapKitView.showsPointsOfInterest = true
        mapKitView.showsUserLocation = true
        
        // Request location permission from users
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        
        // If user authorized location manager
        if CLLocationManager.locationServicesEnabled(){
            // Grab reference to location manager
            locationManager.delegate = self
            // Select Accuracy
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            // Update location
            locationManager.startUpdatingLocation()
        }
        

    }

    // Add the line to the map
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 3.0
        
        return renderer
    }
    
    // Render the map with information
    func renderMap(){
        let overlays = mapKitView.overlays
        mapKitView.removeOverlays(overlays)
        
        // My coordinates
        let sourceCoordinates = locationManager.location?.coordinate
        let destinationCoordinates = CLLocationCoordinate2DMake(destinationLat, destinationLong)
        
        // Create placemarks
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinates!)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinates)
        
        // Create map items
        let sourceItem = MKMapItem(placemark: sourcePlacemark)
        let destinationItem = MKMapItem(placemark: destinationPlacemark)
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourceItem
        directionRequest.destination = destinationItem
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate(completionHandler: {
            response, error in
            guard let response = response else {
                if let error = error{
                    print("Error in getting route")
                }
                // In case the route is not viable, like driving over the ocean, then return
                return
            }
            
            //Get my ETA from MapKit API, convert into Int and String, display at bottom
            let myETA = Int((response.routes.first?.expectedTravelTime)!)
            self.ETA.text = "\(String(describing: myETA/60)) min"
            
            // Grab the actual route, first one
            let route = response.routes[0]
            // Calculate line between locations
            self.mapKitView.add(route.polyline, level:.aboveRoads)
            
            // Zoom in into our location
            let rect = route.polyline.boundingMapRect
            self.mapKitView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        })
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }


}

