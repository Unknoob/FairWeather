//
//  WeatherResultMock.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 02/10/22.
//

import Foundation
@testable import FairWeather

extension Result<LegacyWeather, WeatherError> {
    static var successMock: Result<LegacyWeather, WeatherError> {
        return .success(.mock)
    }
    
    static var successEmptyWeatherMock: Result<LegacyWeather, WeatherError> {
        return .success(.emptyMock)
    }
    
    static var failureServerErrorMock: Result<LegacyWeather, WeatherError> {
        return .failure(.httpError(error: .unknown))
    }
}
