//
//  WeatherMock.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 02/10/22.
//

import Foundation
@testable import FairWeather

extension LegacyWeather {
    static var mock: LegacyWeather {
        return LegacyWeather(
            title: "Toronto",
            consolidatedWeatherList: [
                ConsolidatedWeather(
                    id: 4805883302248448,
                    currentWeather: "Light Rain",
                    iconName: "lr",
                    currentTemperature: 22.33,
                    minimumTemperature: 13.895,
                    maximumTemperature: 22.240000000000002,
                    applicableDate: "2021-09-13"
                ),
                ConsolidatedWeather(
                    id: 5028922455490560,
                    currentWeather: "Light Rain",
                    iconName: "lr",
                    currentTemperature: 23.775,
                    minimumTemperature: 16.95,
                    maximumTemperature: 25.235,
                    applicableDate: "2021-09-14"
                ),
                ConsolidatedWeather(
                    id: 6038117740969984,
                    currentWeather: "Light Rain",
                    iconName: "lr",
                    currentTemperature: 21.54,
                    minimumTemperature: 17.0,
                    maximumTemperature: 21.935000000000002,
                    applicableDate: "2021-09-15"
                ),
                ConsolidatedWeather(
                    id: 6193240316313600,
                    currentWeather: "Light Cloud",
                    iconName: "lc",
                    currentTemperature: 21.95,
                    minimumTemperature: 15.685,
                    maximumTemperature: 21.355,
                    applicableDate: "2021-09-16"
                ),
                ConsolidatedWeather(
                    id: 6732261765414912,
                    currentWeather: "Light Cloud",
                    iconName: "lc",
                    currentTemperature: 26.475,
                    minimumTemperature: 17.884999999999998,
                    maximumTemperature: 24.585,
                    applicableDate: "2021-09-17"
                ),
                ConsolidatedWeather(
                    id: 5865000829714432,
                    currentWeather: "Showers",
                    iconName: "s",
                    currentTemperature: 27.72,
                    minimumTemperature: 19.07,
                    maximumTemperature: 26.770000000000003,
                    applicableDate: "2021-09-18"
                ),
            ]
        )
    }
    
    static var emptyMock: LegacyWeather {
        return LegacyWeather(
            title: "Toronto",
            consolidatedWeatherList: []
        )
    }
}
