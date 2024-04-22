//
//  WeatherPresenter.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

final class WeatherPresenter {
    weak var viewController: WeatherViewControllerProtocol?
}

extension WeatherPresenter: WeatherPresenterProtocol {
    func showLoading() {
        viewController?.changeState(.loading)
    }

    func didLoadWeather(_ result: Result<LegacyWeather, WeatherError>) {
        switch result {
        case let .success(weather):
            handleSuccess(weather)
        case let .failure(weatherError):
            handleFailure(weatherError)
        }
    }

    private func handleSuccess(_ weather: LegacyWeather) {
        guard let latestWeather = weather.consolidatedWeatherList.last else {
            viewController?.changeState(.error(error: .emptyWeather))
            return
        }
        let iconURL = URL(
            string: "https://cdn.faire.com/static/mobile-take-home/icons/\(latestWeather.iconName).png"
        )

        let viewModel = WeatherViewModel(
            title: weather.title,
            iconURL: iconURL,
            currentTemperature: "\(Int(latestWeather.currentTemperature))°",
            currentWeather: latestWeather.currentWeather,
            minimumTemperature: "L: \(Int(latestWeather.minimumTemperature))°",
            maximumTemperature: "H: \(Int(latestWeather.maximumTemperature))°"
        )

        viewController?.changeState(.success(viewModel: viewModel))
    }

    private func handleFailure(_ error: WeatherError) {
        viewController?.changeState(.error(error: error))
    }
}
