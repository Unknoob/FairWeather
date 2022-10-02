//
//  WeatherResultMock.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 02/10/22.
//

import Foundation
@testable import FairWeather

extension Result<Weather, WeatherError> {
    static var successMock: Result<Weather, WeatherError> {
        return .success(.mock)
    }
    
    static var successEmptyWeatherMock: Result<Weather, WeatherError> {
        return .success(.emptyMock)
    }
    
    static var failureServerErrorMock: Result<Weather, WeatherError> {
        return .failure(.httpError(error: .unknown))
    }
}
