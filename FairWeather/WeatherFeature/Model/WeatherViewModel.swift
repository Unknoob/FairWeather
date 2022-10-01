//
//  WeatherViewModel.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation
import UIKit

struct WeatherViewModel: Equatable {
    let title: String
    let iconURL: URL?
    let currentTemperature: String
    let currentWeather: String
    let minimumTemperature: String
    let maximumTemperature: String
}
