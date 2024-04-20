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
    func showWeatherList(_ weather: Weather) {
//        let weatherListViewController = WeatherListFactory.buildViewController(weather)
//        viewController?.navigationController?.pushViewController(weatherListViewController, animated: true)

        let consolidatedWeatherListViewModel = weather.consolidatedWeatherList.map({
            ConsolidatedWeatherViewModel(consolidatedWeather: $0)
        })

        let weatherListView = NewWeatherListView(consolidatedWeatherListViewModel: consolidatedWeatherListViewModel)
        let hostingController = UIHostingController(rootView: weatherListView)
        hostingController.title = "Forecast"
        viewController?.navigationController?.pushViewController(hostingController, animated: true)
    }
}
