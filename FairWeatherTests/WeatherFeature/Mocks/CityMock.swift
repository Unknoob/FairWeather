//
//  CityMock.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation
@testable import FairWeather

extension City {
    static var rio: City {
        return City(
            name: "Rio De janeiro",
            lat: -22.908333,
            lon: -43.196388,
            state: "RJ",
            country: "BR"
        )
    }
}
