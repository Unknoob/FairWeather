//
//  WeatherListPresenter.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 12/10/22.
//

import Foundation

class WeatherListPresenter {
    let interactor: WeatherListInteractorInputProtocol
    let router: WeatherListRouterProtocol

    weak var viewController: WeatherListViewControllerProtocol?

    init(
        interactor: WeatherListInteractorInputProtocol,
        router: WeatherListRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
}

extension WeatherListPresenter: WeatherListPresenterInputProtocol {
    func viewDidLoad() {
        interactor.loadWeather()
    }
}

extension WeatherListPresenter: WeatherListInteractorOutputProtocol {
    func didLoadWeather(_ weather: LegacyWeather) {
        let forecasts = weather.consolidatedWeatherList.map { consolidatedWeather in
            return LegacyWeatherForecastViewModel(
                iconURL: URL(
                    string: "https://cdn.faire.com/static/mobile-take-home/icons/\(consolidatedWeather.iconName).png"
                ),
                title: "\(consolidatedWeather.applicableDate) - \(consolidatedWeather.currentWeather)",
                subtitle: "\(consolidatedWeather.minimumTemperature)°C to \(consolidatedWeather.maximumTemperature)°C"
            )
        }

        viewController?.updateView(
            WeatherListViewModel(title: "\(forecasts.count) day forecast", forecastList: forecasts)
        )
    }
}
