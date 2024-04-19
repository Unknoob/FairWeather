//
//  WeatherListViewModel.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 12/10/22.
//

import Foundation

struct WeatherListViewModel {
    let title: String
    let forecastList: [WeatherForecastViewModel]
}

struct WeatherForecastViewModel {
    let iconURL: URL?
    let title: String
    let subtitle: String
}
