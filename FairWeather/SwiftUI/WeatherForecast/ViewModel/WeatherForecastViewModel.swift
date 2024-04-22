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
    @Published var isShowingAlert = false

    let networkService: NetworkServiceProtocol
    let userDefaultsUtil: UserDefaultsUtilProtocol
    let city: City
    let showSetHomeButton: Bool

    init(
        networkService: NetworkServiceProtocol = NetworkService(),
        userDefaultsUtil: UserDefaultsUtilProtocol = UserDefaultsUtil(),
        city: City,
        showSetHomeButton: Bool
    ) {
        self.networkService = networkService
        self.userDefaultsUtil = userDefaultsUtil
        self.city = city
        self.showSetHomeButton = showSetHomeButton
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

    func updateHomeCity() {
        isShowingAlert = true
        userDefaultsUtil.saveObject(city, key: .city)
    }
}

