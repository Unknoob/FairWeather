//
//  WeatherFactoryTests.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 19/04/24.
//

import XCTest
@testable import FairWeather

final class WeatherFactoryTests: XCTestCase {

    func testViewControllerDeinit() throws {
        let sut = makeSut()
        
        XCTAssertNotNil(sut)
    }
}

extension WeatherFactoryTests {
    private func makeSut() -> WeatherViewController {
        let sut = WeatherFactory.buildViewController()
        
        addTeardownBlock { [weak sut] in
            XCTAssertNil(sut)
        }
        
        return sut
    }
}
