//
//  CurrentWeatherRequest.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

enum CurrentWeatherRequest: RequestProtocol {

    case getWeather(lat: Double, lon: Double)

    var baseURL: String {
        return "https://api.openweathermap.org/data/2.5"
    }

    var endpoint: String {
        switch self {
        case .getWeather:
            return "/weather"
        }
    }

    var method: RequestMethods {
        switch self {
        case .getWeather:
            return .GET
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case let .getWeather(lat, lon):
            var parameters = defaultParameters ?? [:]
            parameters["lat"] = lat
            parameters["lon"] = lon
            parameters["units"] = "metric"
            parameters["lang"] = "pt_br"

            return parameters
        }
    }

    var headers: [String: String]? {
        return nil
    }
}
