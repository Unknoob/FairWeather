//
//  WeatherError.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

enum WeatherError: Error {
    case httpError(error: HTTPError)
    case parsingError
    case emptyWeather
    case urlError
}
