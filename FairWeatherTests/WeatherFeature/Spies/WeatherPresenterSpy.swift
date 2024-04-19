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
        case didLoadWeather(result: Result<Weather, WeatherError>)
    }
    
    var calledMethods: [Method] = []
}

extension WeatherPresenterSpy: WeatherPresenterProtocol {
    func showLoading() {
        calledMethods.append(.showLoading)
    }
    
    func didLoadWeather(_ result: Result<Weather, WeatherError>) {
        calledMethods.append(.didLoadWeather(result: result))
    }
}

extension WeatherPresenterSpy.Method: Equatable {
    static func == (lhs: WeatherPresenterSpy.Method, rhs: WeatherPresenterSpy.Method) -> Bool {
        switch (lhs, rhs) {
        case (.showLoading, .showLoading):
            return true
        case let (.didLoadWeather(lhsResult), .didLoadWeather(rhsResult)):
            return lhsResult == rhsResult
        default:
            return false
        }
    }
}
