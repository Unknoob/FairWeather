//
//  WeatherRouter.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation
import SwiftUI
import UIKit

final class WeatherRouter {
    weak var viewController: UIViewController?
}

extension WeatherRouter: WeatherRouterProtocol {
    @MainActor func showWeatherForecast(for city: City) {
        let weatherForecastView = WeatherForecastView(
            viewModel: WeatherForecastViewModel(city: city, showSetHomeButton: false)
        )
        let hostingController = UIHostingController(rootView: weatherForecastView)
        hostingController.title = city.name
        viewController?.title = "Home"
        viewController?.navigationController?.pushViewController(hostingController, animated: true)
    }

    func showCitySearch() {
        let citySearchView = CitySearchView()
        let hostingController = UIHostingController(rootView: citySearchView)
        hostingController.title = "Search"
        viewController?.title = "Home"
        viewController?.navigationController?.pushViewController(hostingController, animated: true)
    }
}
