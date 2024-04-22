//
//  WeatherList.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

struct WeatherList: Codable {
    let message: String
    let cod: String
    let count: Int
    let citiesList: [CityInformation]

    enum CodingKeys: String, CodingKey {
        case message
        case cod
        case count
        case citiesList = "list"
    }
}
