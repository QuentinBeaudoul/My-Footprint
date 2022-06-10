//
//  AirportAnnotation.swift
//  MFFlight
//
//  Created by Quentin on 10/06/2022.
//

import MapKit

class AirportAnnotation: NSObject, MKAnnotation {

    private(set) var coordinate: CLLocationCoordinate2D
    let airport: Airport

    init(airport: Airport) {
        self.airport = airport
        coordinate = CLLocationCoordinate2D()
        super.init()
        setCoordinates()
    }

    private func setCoordinates() {
        let latitude = airport.latitude.toDouble() ?? 0
        let longitude = airport.longitude.toDouble() ?? 0

        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
