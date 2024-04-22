//
//  WeatherList.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

struct WeatherList: Decodable {
    let count: Int
    let weatherForecast: [WeatherForecast]

    enum CodingKeys: String, CodingKey {
        case count = "cnt"
        case weatherForecast = "list"
    }
}
