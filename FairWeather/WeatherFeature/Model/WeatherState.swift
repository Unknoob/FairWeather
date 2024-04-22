//
//  WeatherState.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

enum WeatherState: Equatable {
    case loading
    case error(error: RequestError)
    case success(viewModel: WeatherViewModel)
}
