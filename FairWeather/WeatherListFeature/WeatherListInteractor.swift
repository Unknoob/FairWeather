//
//  WeatherListInteractor.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 12/10/22.
//

import Foundation

class WeatherListInteractor {
    weak var presenter: WeatherListInteractorOutputProtocol?

    private let weather: LegacyWeather

    init(_ weather: LegacyWeather) {
        self.weather = weather
    }
}

extension WeatherListInteractor: WeatherListInteractorInputProtocol {
    func loadWeather() {
        presenter?.didLoadWeather(weather)
    }
}
