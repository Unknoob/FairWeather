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
            title: "São Paulo",
            iconURL: URL(string: "https://openweathermap.org/img/w/01d.png"),
            currentTemperature: "25°C",
            currentWeather: "céu limpo",
            minimumTemperature: "Min: 25°C",
            maximumTemperature: "Max: 29°C"
        )
    }
}
