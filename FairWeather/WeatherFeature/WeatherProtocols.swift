//
//  WeatherProtocols.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

protocol WeatherViewControllerProtocol: AnyObject {
    func changeState(_ state: WeatherState)
}

protocol WeatherPresenterProtocol: AnyObject {
    func showLoading()
    func didLoadWeather(_ result: Result<WeatherForecast, RequestError>, city: City)
}

protocol WeatherInteractorProtocol: AnyObject {
    func loadWeather()
    func showForecastList()
    func showCitySearch()
}

protocol WeatherRouterProtocol: AnyObject {
    func showWeatherForecast(for city: City)
    func showCitySearch()
}
