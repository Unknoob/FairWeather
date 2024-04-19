//
//  WeatherListInteractor.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 12/10/22.
//

import Foundation

class WeatherListInteractor {
    weak var presenter: WeatherListInteractorOutputProtocol?
    
    private let weather: Weather
    
    init(_ weather: Weather) {
        self.weather = weather
    }
}

extension WeatherListInteractor: WeatherListInteractorInputProtocol {
    func loadWeather() {
        presenter?.didLoadWeather(weather)
    }
}
