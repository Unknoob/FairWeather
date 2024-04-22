//
//  WeatherPresenterSpy.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 02/10/22.
//

import Foundation
@testable import FairWeather

class WeatherPresenterSpy {
    enum Method {
        case showLoading
        case didLoadWeather(result: Result<WeatherForecast, RequestError>, city: City)
    }
    
    var calledMethods: [Method] = []
}

extension WeatherPresenterSpy: WeatherPresenterProtocol {
    func showLoading() {
        calledMethods.append(.showLoading)
    }
    
    func didLoadWeather(_ result: Result<WeatherForecast, RequestError>, city: City) {
        calledMethods.append(.didLoadWeather(result: result, city: city))
    }
}

extension WeatherPresenterSpy.Method: Equatable {
    static func == (lhs: WeatherPresenterSpy.Method, rhs: WeatherPresenterSpy.Method) -> Bool {
        switch (lhs, rhs) {
        case (.showLoading, .showLoading):
            return true
        case let (.didLoadWeather(lhsResult, lhsCity), .didLoadWeather(rhsResult, rhsCity)):
            return lhsResult == rhsResult && lhsCity == rhsCity
        default:
            return false
        }
    }
}
