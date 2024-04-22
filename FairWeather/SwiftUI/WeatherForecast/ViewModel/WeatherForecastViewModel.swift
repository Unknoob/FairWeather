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
    @Published var isLoading: Bool = true

    let networkService: NetworkServiceProtocol
    let city: City

    init(
        networkService: NetworkServiceProtocol = NetworkService(),
        city: City
    ) {
        self.networkService = networkService
        self.city = city
        Task {
            await fetchForecast()
        }
    }

    func fetchForecast() async {
        isLoading = true
        let request = WeatherForecastRequest.getForecast(lat: city.lat, lon: city.lon)
        do {
            let result: Result<WeatherList, RequestError> = try await networkService.executeRequest(request: request)
            isLoading = false
            switch result {
            case let .success(forecast):
                self.forecast = forecast
                print(forecast)
            case let .failure(error):
                print(error)
            }
        } catch {
            isLoading = false
            print(error)
        }
    }
}

