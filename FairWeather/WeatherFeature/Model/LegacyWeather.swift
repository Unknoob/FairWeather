//
//  LegacyWeather.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

struct LegacyWeather: Equatable {
    let title: String
    let consolidatedWeatherList: [ConsolidatedWeather]
}

extension LegacyWeather: Codable {
    enum CodingKeys: String, CodingKey {
        case title
        case consolidatedWeatherList = "consolidated_weather"
    }
}
