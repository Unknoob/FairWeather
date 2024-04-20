//
//  WeatherListProtocols.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 12/10/22.
//

import Foundation

protocol WeatherListViewControllerProtocol: AnyObject {
    func updateView(_ viewModel: WeatherListViewModel)
}

protocol WeatherListPresenterInputProtocol: AnyObject {
    func viewDidLoad()
}

protocol WeatherListInteractorInputProtocol: AnyObject {
    func loadWeather()
}

protocol WeatherListInteractorOutputProtocol: AnyObject {
    func didLoadWeather(_ weather: Weather)
}

protocol WeatherListRouterProtocol: AnyObject { }
