//
//  Weather.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

struct Weather {
    let title: String
    let consolidatedWeatherList: [ConsolidatedWeather]
}

extension Weather: Codable {
    enum CodingKeys: String, CodingKey {
        case title
        case consolidatedWeatherList = "consolidated_weather"
    }
}
