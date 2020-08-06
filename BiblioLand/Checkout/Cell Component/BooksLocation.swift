//
//  BooksLocation.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 24/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class BooksLocation: UITableViewCell {

    var method = ["Self Pickup", "Ojek DQ Same Day", "Ojek DQ Instant"]
    
    @IBOutlet weak var deliveryMethod: UITextField!
    @IBOutlet weak var pickupTime: UITextField!
    @IBOutlet weak var deliveryCost: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationLavel: UILabel!
    
    let timePick = UIDatePicker()
    let locale = Locale.preferredLanguages.first
    var deliverPay = 15000
    
    var locationManager:CLLocationManager!
    var userLong = 0.0
    var userLat = 0.0

    func setUpTimePick() {
        pickupTime.inputView = timePick
        timePick.datePickerMode = .time
        timePick.locale = Locale(identifier: locale!)
        
        timePick.minimumDate = Date()
        timePick.addTarget(self, action: #selector(timePickerChange), for: .valueChanged)
    }
    
    func createPickerView() {
       let pickerView = UIPickerView()
       pickerView.delegate = self
       deliveryMethod.inputView = pickerView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        locationManager = CLLocationManager()
        locationManager.delegate = self

        TableShadowDecorate()
        pickingMap()
        getAccessUserLocation()
        createPickerView()
        setUpTimePick()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension BooksLocation: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation

        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")

        userLat = userLocation.coordinate.latitude
        userLong = userLocation.coordinate.longitude
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if (error != nil){
                print("error in reverseGeocode")
            }
            
//            let placemark = placemarks! as [CLPlacemark]
//            if placemark.count>0{
//                let placemark = placemarks![0]
//                print(placemark.locality!)
//                print(placemark.administrativeArea!)
//                print(placemark.country!)

//                self.labelAdd.text = "\(placemark.locality!), \(placemark.administrativeArea!), \(placemark.country!)"
//            }
        }

    }
        
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
}

extension BooksLocation {
    func getAccessUserLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
    }
    
    func pickingMap() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: -6.302423, longitude: 106.652202)
        annotation.title = "BSD Green Office Park 9"
        annotation.subtitle = "Book Location"
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 400, longitudinalMeters: 400)
        mapView.setRegion(region, animated: true )
        
        let bookLocation = CLLocation(latitude: -6.302423, longitude: 106.652202)
        let userLoc = CLLocation(latitude: userLat, longitude: userLong)
        
        let distance = bookLocation.distance(from: userLoc)
        let distanceKm = Int(distance) / 1000
            
        locationLavel.text = "BSD Green Office Park, Tanggerang (~\(distanceKm/1000) Km)"
    }
    
    @objc func timePickerChange() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        pickupTime.text = formatter.string(from: timePick.date)
    }
}

extension BooksLocation: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return method.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return method[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            deliveryMethod.text = method[row]
            pickupTime.text = ""
            pickupTime.isEnabled = true
            deliveryCost.text = "Rp0"
        } else {
            deliveryMethod.text = method[row]
            pickupTime.text = "-"
            pickupTime.isEnabled = false
            deliveryCost.text = "Rp\(idrFormat(harga: deliverPay))"
        }
    }
}
