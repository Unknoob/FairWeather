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
    private let networkService: NetworkService
    
    private var weather: Weather?
    
    init(
        presenter: WeatherPresenterProtocol,
        router: WeatherRouterProtocol,
        networkService: NetworkService
    ) {
        self.presenter = presenter
        self.router = router
        self.networkService = networkService
    }
}

extension WeatherInteractor: WeatherInteractorProtocol {
    func loadWeather() {
        guard let url = URL(string: "https://cdn.faire.com/static/mobile-take-home/4418.json") else {
            presenter.didLoadWeather(.failure(.urlError))
            return
        }
        let request = URLRequest(url: url)
        networkService.makeRequest(request) { [weak self] result in
            switch result {
            case let .success(data):
                guard let weather = try? JSONDecoder().decode(Weather.self, from: data) else {
                    self?.presenter.didLoadWeather(.failure(.parsingError))
                    return
                }
                self?.weather = weather
                self?.presenter.didLoadWeather(.success(weather))
            case .failure:
                self?.presenter.didLoadWeather(.failure(.httpError(error: .unknown)))
            }
        }
    }
    
    func showForecastList() {
        guard let weather = weather else {
            return
        }
        router.showWeatherList(weather)
    }
}
