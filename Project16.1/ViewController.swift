//
//  ViewController.swift
//  Project16.1
//
//  Created by Maks Vogtman on 13/12/2022.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Over 300 languages are spoken in here.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the city of love.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let warsaw = Capital(title: "Warsaw", coordinate: CLLocationCoordinate2D(latitude: 52.237049, longitude: 21.017532), info: "Warsaw is one of the most congested cities in Europe, with citizens spending an average of 106 hours sitting in traffic every year.")
        let washington = Capital(title: "Washington", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        let rio = Capital(title: "Rio de Janeiro", coordinate: CLLocationCoordinate2D(latitude: -22.908333, longitude:  -43.196388), info: "It is named after the river that doesn't exist.")
        let johannesburg = Capital(title: "Johannesburg", coordinate: CLLocationCoordinate2D(latitude: -26.195246, longitude: 28.034088), info: "It's been rebuilt four times.")
        let beijing = Capital(title: "Beijing", coordinate: CLLocationCoordinate2D(latitude: 39.916668, longitude: 116.383331), info: "Beijing pronunciation became standard Mandarin.")
        let lisbon = Capital(title: "Lisbon", coordinate: CLLocationCoordinate2D(latitude: 38.736946, longitude: -9.142685), info: "Lisbon was completely destroyed in the earthquake of 1755.")
        
        mapView.addAnnotations([london, oslo, paris, rome, warsaw, washington, rio, johannesburg, beijing, lisbon])
        
        mapType()
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        let identifier = "Capital"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.pinTintColor = .magenta
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }


    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
        if let vc = navigationController?.storyboard?.instantiateViewController(withIdentifier: "Wiki") as? WikiVC {
            vc.capital = capital
            present(vc, animated: true)
        }
    }
    
    
    func mapType() {
        let ac = UIAlertController(title: "Map Style", message: "Select map style", preferredStyle: .actionSheet)
        
        ac.addAction(UIAlertAction(title: "Standard", style: .default, handler: { _ in self.mapView.mapType = .standard }))
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: { _ in self.mapView.mapType = .hybrid }))
        ac.addAction(UIAlertAction(title: "Satellite", style: .default, handler: { _ in self.mapView.mapType = .satellite }))
        ac.addAction(UIAlertAction(title: "Hybrid Flyover", style: .default, handler: { _ in self.mapView.mapType = .hybridFlyover }))
        ac.addAction(UIAlertAction(title: "Muted Standard", style: .default, handler: { _ in self.mapView.mapType = .mutedStandard }))
        ac.addAction(UIAlertAction(title: "Satellite Flyover", style: .default, handler: { _ in self.mapView.mapType = .satelliteFlyover }))
        
        present(ac, animated: true)
    }
}

