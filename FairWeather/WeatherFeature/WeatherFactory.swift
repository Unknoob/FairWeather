//
//  WeatherFactory.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

class WeatherFactory {
    
    static func buildViewController() -> WeatherViewController {
        let interactor = WeatherInteractor(networkService: Network())
        let router = WeatherRouter()
        let presenter = WeatherPresenter(interactor: interactor, router: router)
        let viewController = WeatherViewController(presenter: presenter)
        
        presenter.viewController = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
}
