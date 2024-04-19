//
//  WeatherRouterSpy.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 19/04/24.
//

import Foundation
@testable import FairWeather

class WeatherRouterSpy {
    enum Method {
        case showWeatherList(weather: Weather)
    }
    
    var calledMethods: [Method] = []
}

extension WeatherRouterSpy: WeatherRouterProtocol {
    func showWeatherList(_ weather: Weather) {
        calledMethods.append(.showWeatherList(weather: weather))
    }
}

extension WeatherRouterSpy.Method: Equatable {}
