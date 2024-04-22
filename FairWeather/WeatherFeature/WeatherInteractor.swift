//
//  WeatherInteractor.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

final class WeatherInteractor {
    private let presenter: WeatherPresenterProtocol
    private let router: WeatherRouterProtocol
    private let networkService: LegacyNetworkService
    private let userDefaultsUtil: UserDefaultsUtilProtocol

    private var weather: WeatherForecast?

    init(
        presenter: WeatherPresenterProtocol,
        router: WeatherRouterProtocol,
        networkService: LegacyNetworkService,
        userDefaultsUtil: UserDefaultsUtilProtocol = UserDefaultsUtil()
    ) {
        self.presenter = presenter
        self.router = router
        self.networkService = networkService
        self.userDefaultsUtil = userDefaultsUtil
    }
}

extension WeatherInteractor: WeatherInteractorProtocol {
    func loadWeather() {
        let city: City = userDefaultsUtil.retrieveObject(forKey: .city) ?? City.defaultCity
        do {
            let request = try CurrentWeatherRequest.getWeather(lat: city.lat, lon: city.lon).buildRequest()
            presenter.showLoading()

            networkService.makeRequest(request) { [weak self] result in
                switch result {
                case let .success(data):
                    do {
                        let weather = try JSONDecoder().decode(WeatherForecast.self, from: data)
                        self?.weather = weather
                        self?.presenter.didLoadWeather(.success(weather), city: city)
                    } catch {
                        self?.presenter.didLoadWeather(.failure(.decodingError(error)), city: city)
                    }
                case let .failure(error):
                    self?.presenter.didLoadWeather(.failure(.unknown(error)), city: city)
                }
            }

        } catch {
            if let requestError = error as? RequestError {
                presenter.didLoadWeather(.failure(requestError), city: city)
            }

        }
    }

    func showForecastList() {
        let city: City = userDefaultsUtil.retrieveObject(forKey: .city) ?? City.defaultCity
        router.showWeatherForecast(for: city)
    }

    func showCitySearch() {
        router.showCitySearch()
    }
}
