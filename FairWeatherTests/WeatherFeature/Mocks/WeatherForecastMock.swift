//
//  WeatherMock.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 02/10/22.
//

import Foundation
@testable import FairWeather

extension WeatherForecast {
    static var mock: WeatherForecast {
        return WeatherForecast(
            mainInformation: MainInformation(
                currentTemperature: 25.97,
                airPressure: 1012,
                airHumidity: 61,
                minimumTemperature: 25.97,
                maximumTemperature: 29.99
            ),
            date: Date(timeIntervalSince1970: 1713809648),
            weatherList: [
                Weather(
                    id: 800,
                    name: "Clear",
                    description: "céu limpo",
                    icon: "01d"
                )
            ],
            windInformation: Wind(
                speed: 4.63,
                degrees: 160
            ),
            cloudInformation: CloudInformation(
                allCloudsPercentage: 0
            )
        )
    }
    
    static var emptyMock: WeatherForecast {
        return WeatherForecast(
            mainInformation: MainInformation(
                currentTemperature: 25.97,
                airPressure: 1012,
                airHumidity: 61,
                minimumTemperature: 25.97,
                maximumTemperature: 29.99
            ),
            date: Date(timeIntervalSince1970: 1713809648),
            weatherList: [],
            windInformation: Wind(
                speed: 4.63,
                degrees: 160
            ),
            cloudInformation: CloudInformation(
                allCloudsPercentage: 0
            )
        )
    }
}
