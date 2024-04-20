//
//  ConsolidatedWeather.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

struct ConsolidatedWeather: Equatable {
    let id: Int
    let currentWeather: String
    let iconName: String
    let currentTemperature: Double
    let minimumTemperature: Double
    let maximumTemperature: Double
    let applicableDate: String
}

extension ConsolidatedWeather: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case currentWeather = "weather_state_name"
        case iconName = "weather_state_abbr"
        case currentTemperature = "the_temp"
        case minimumTemperature = "min_temp"
        case maximumTemperature = "max_temp"
        case applicableDate = "applicable_date"
    }
}
