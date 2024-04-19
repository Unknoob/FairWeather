//
//  WeatherViewModelMock.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 19/04/24.
//

import Foundation
@testable import FairWeather

extension WeatherViewModel {
    static var mock: WeatherViewModel {
        return WeatherViewModel(
            title: "Toronto",
            iconURL: URL(
                string: "https://cdn.faire.com/static/mobile-take-home/icons/s.png"
            ),
            currentTemperature: "27°",
            currentWeather: "Showers",
            minimumTemperature: "L: 19°",
            maximumTemperature: "H: 26°"
        )
    }
}
