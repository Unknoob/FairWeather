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

    func didLoadWeather(_ result: Result<WeatherForecast, RequestError>, city: City) {
        switch result {
        case let .success(weather):
            handleSuccess(weather, city: city)
        case let .failure(weatherError):
            handleFailure(weatherError)
        }
    }

    private func handleSuccess(_ weather: WeatherForecast, city: City) {
        guard let latestWeather = weather.weatherList.first else {
            viewController?.changeState(.error(error: .emptyWeather))
            return
        }

        let viewModel = WeatherViewModel(
            title: city.name,
            iconURL: weather.iconURL,
            currentTemperature: weather.mainInformation.currentTemperature.formattedAsCelsiusTemperature,
            currentWeather: latestWeather.description,
            minimumTemperature: "Min: \(weather.mainInformation.minimumTemperature.formattedAsCelsiusTemperature)",
            maximumTemperature: "Max: \(weather.mainInformation.maximumTemperature.formattedAsCelsiusTemperature)"
        )

        viewController?.changeState(.success(viewModel: viewModel))
    }

    private func handleFailure(_ error: RequestError) {
        viewController?.changeState(.error(error: error))
    }
}
