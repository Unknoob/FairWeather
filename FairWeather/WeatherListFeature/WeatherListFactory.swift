//
//  WeatherListFactory.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 12/10/22.
//

import Foundation

class WeatherListFactory {
    
    static func buildViewController(_ weather: Weather) -> WeatherListViewController {
        let interactor = WeatherListInteractor(weather)
        let router = WeatherListRouter()
        let presenter = WeatherListPresenter(interactor: interactor, router: router)
        let viewController = WeatherListViewController(presenter: presenter)
        
        presenter.viewController = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
}
