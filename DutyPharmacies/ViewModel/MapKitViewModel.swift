//
//  MapKitViewModel.swift
//  DutyPharmacies
//
//  Created by İbrahim Bayram on 17.03.2023.
//

import Foundation
import MapKit
struct GoMapViewModel {
    
    static let shared = GoMapViewModel()
    
    func openInMap(selectedPharmacy : Pharmacy) {
        let latitudeString = selectedPharmacy.loc.components(separatedBy: ",")[0]
        let longitudeString = selectedPharmacy.loc.components(separatedBy: ",")[1]
        let latitude: CLLocationDegrees = Double(latitudeString)!
        let longitude: CLLocationDegrees = Double(longitudeString)!
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = selectedPharmacy.name
        mapItem.openInMaps(launchOptions: options)
    }
}
