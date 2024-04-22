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
        case showWeatherForecast(city: City)
        case showCitySearch
    }
    
    var calledMethods: [Method] = []
}

extension WeatherRouterSpy: WeatherRouterProtocol {
    func showWeatherForecast(for city: City) {
        calledMethods.append(.showWeatherForecast(city: city))
    }

    func showCitySearch() {
        calledMethods.append(.showCitySearch)
    }
}

extension WeatherRouterSpy.Method: Equatable {}
