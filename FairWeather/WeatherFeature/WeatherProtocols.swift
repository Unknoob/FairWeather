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

protocol WeatherPresenterInputProtocol: AnyObject {
    func viewDidLoad()
}

protocol WeatherInteractorInputProtocol: AnyObject {
    func loadWeather()
}

protocol WeatherInteractorOutputProtocol: AnyObject {
    func didLoadWeather(_ result: Result<Weather, WeatherError>)
}

protocol WeatherRouterProtocol: AnyObject {
    
}
