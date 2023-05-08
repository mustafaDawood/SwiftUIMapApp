//
//  Location.swift
//  SwiftUIMapApp
//
//  Created by Mac on 4/4/23.
//

import Foundation
import MapKit

struct Location : Identifiable , Equatable {
    
    var id : String {
        name + cityName
    }
    let name : String
    let cityName : String
    let coordinates : CLLocationCoordinate2D
    let description : String
    let imageNames : [String]
    let link : String
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}


