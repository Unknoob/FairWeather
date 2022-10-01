//
//  WeatherInteractor.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

class WeatherInteractor {
    weak var presenter: WeatherInteractorOutputProtocol?
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension WeatherInteractor: WeatherInteractorInputProtocol {
    func loadWeather() {
        guard let url = URL(string: "https://cdn.faire.com/static/mobile-take-home/4418.json") else {
            presenter?.didLoadWeather(.failure(.urlError))
            return
        }
        let request = URLRequest(url: url)
        networkService.makeRequest(request) { [weak self] result in
            switch result {
            case let .success(data):
                guard let weather = try? JSONDecoder().decode(Weather.self, from: data) else {
                    self?.presenter?.didLoadWeather(.failure(.parsingError))
                    return
                }
                self?.presenter?.didLoadWeather(.success(weather))
            case .failure:
                self?.presenter?.didLoadWeather(.failure(.httpError(error: .unknown)))
            }
        }
    }
}
