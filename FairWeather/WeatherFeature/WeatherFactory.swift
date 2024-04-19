//
//  WeatherFactory.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

final class WeatherFactory {
    static func buildViewController() -> WeatherViewController {
        let router = WeatherRouter()
        let presenter = WeatherPresenter()
        let interactor = WeatherInteractor(
            presenter: presenter,
            router: router,
            networkService: Network()
        )
        
        let viewController = WeatherViewController(interactor: interactor)
        
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
