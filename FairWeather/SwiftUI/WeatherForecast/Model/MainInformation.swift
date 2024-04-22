//
//  MainInformation.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

struct MainInformation: Codable {
    let currentTemperature: Double
    let airPressure: Double
    let airHumidity: Int
    let minimumTemperature: Double
    let maximumTemperature: Double

    enum CodingKeys: String, CodingKey {
        case currentTemperature = "temp"
        case airPressure = "pressure"
        case airHumidity = "humidity"
        case minimumTemperature = "temp_min"
        case maximumTemperature = "temp_max"
    }

}
