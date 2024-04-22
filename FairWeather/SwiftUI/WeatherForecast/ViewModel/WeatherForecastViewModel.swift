//
//  WeatherForecastViewModel.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Combine
import SwiftUI

@MainActor class WeatherForecastViewModel: ObservableObject {
    @Published var forecast: WeatherList? = nil

    let networkService: NetworkServiceProtocol
    let city: City

    init(
        networkService: NetworkServiceProtocol = NetworkService(),
        city: City
    ) {
        self.networkService = networkService
        self.city = city
    }

    func fetchForecast() async {
        let request = WeatherForecastRequest.getForecast(lat: city.lat, lon: city.lon)
        do {
            let result: Result<WeatherList, RequestError> = try await networkService.executeRequest(request: request)
            switch result {
            case let .success(forecast):
                self.forecast = forecast
            case let .failure(error):
                print(error)
            }
        } catch {
            print(error)
        }
    }
}

