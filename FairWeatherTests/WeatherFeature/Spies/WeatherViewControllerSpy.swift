//
//  WeatherViewControllerSpy.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 19/04/24.
//

import Foundation
@testable import FairWeather

class WeatherViewControllerSpy {
    enum Method {
        case changeState(state: WeatherState)
    }
    
    var calledMethods: [Method] = []
}

extension WeatherViewControllerSpy: WeatherViewControllerProtocol {
    func changeState(_ state: WeatherState) {
        calledMethods.append(.changeState(state: state))
    }
}

extension WeatherViewControllerSpy.Method: Equatable {}
