//
//  Coordinates.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
}
