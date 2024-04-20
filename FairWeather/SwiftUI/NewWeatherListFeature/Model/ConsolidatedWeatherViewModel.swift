//
//  ConsolidatedWeatherViewModel.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 20/04/24.
//

import Foundation

struct ConsolidatedWeatherViewModel: Identifiable {
    let id: Int
    let iconURL: URL?
    let currentTemperature: String
    let currentWeather: String
    let minimumTemperature: String
    let maximumTemperature: String
    let applicableDate: String

    init(consolidatedWeather: ConsolidatedWeather) {
        self.id = consolidatedWeather.id
        self.iconURL = URL(
            string: "https://cdn.faire.com/static/mobile-take-home/icons/\(consolidatedWeather.iconName).png"
        )
        self.currentTemperature = "\(Int(consolidatedWeather.currentTemperature))°"
        self.currentWeather = consolidatedWeather.currentWeather
        self.minimumTemperature = "Low: \(Int(consolidatedWeather.minimumTemperature))°"
        self.maximumTemperature = "High: \(Int(consolidatedWeather.maximumTemperature))°"
        self.applicableDate = consolidatedWeather.applicableDate
    }
}
