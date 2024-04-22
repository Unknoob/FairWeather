//
//  WeatherResultMock.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 02/10/22.
//

import Foundation
@testable import FairWeather

extension Result<WeatherForecast, RequestError> {
    static var successMock: Result<WeatherForecast, RequestError> {
        return .success(.mock)
    }
    
    static var successEmptyWeatherMock: Result<WeatherForecast, RequestError> {
        return .success(.emptyMock)
    }
    
    static var failureServerErrorMock: Result<WeatherForecast, RequestError> {
        return .failure(.unknown(HTTPError.badRequest))
    }
}
