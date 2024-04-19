//
//  WeatherRouter.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation
import UIKit

final class WeatherRouter {
    weak var viewController: UIViewController?
}

extension WeatherRouter: WeatherRouterProtocol {
    func showWeatherList(_ weather: Weather) {
        let weatherListViewController = WeatherListFactory.buildViewController(weather)
        viewController?.navigationController?.pushViewController(weatherListViewController, animated: true)
    }
}
