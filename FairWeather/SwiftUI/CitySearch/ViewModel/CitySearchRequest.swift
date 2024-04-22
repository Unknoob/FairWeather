//
//  CitySearchRequest.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

enum CitySearchRequest: RequestProtocol {

    case searchByName(name: String)

    var baseURL: String {
        return "https://api.openweathermap.org/geo/1.0"
    }

    var endpoint: String {
        switch self {
        case .searchByName:
            return "/direct"
        }
    }

    var method: RequestMethods {
        switch self {
        case .searchByName:
            return .GET
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case let .searchByName(name):
            var parameters = defaultParameters ?? [:]
            parameters["q"] = name

            return parameters
        }
    }

    var headers: [String: String]? {
        return nil
    }
}
