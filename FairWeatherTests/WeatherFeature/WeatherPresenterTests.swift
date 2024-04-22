//
//  WeatherPresenterTests.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 19/04/24.
//

import XCTest
@testable import FairWeather

final class WeatherPresenterTests: XCTestCase {
    
    func testShowLoading() throws {
        let (sut, spies) = makeSut()
        
        sut.showLoading()
        
        XCTAssertEqual(spies.viewControllerSpy.calledMethods, [.changeState(state: .loading)])
    }
    
    func testDidLoadWeatherSuccessfully() throws {
        let (sut, spies) = makeSut()
        
        sut.didLoadWeather(.success(.mock), city: City.defaultCity)
        
        XCTAssertEqual(spies.viewControllerSpy.calledMethods, [.changeState(state: .success(viewModel: .mock))])
    }
    
    func testDidLoadWeatherFailure() throws {
        let (sut, spies) = makeSut()
        
        sut.didLoadWeather(.failure(.badRequest), city: City.defaultCity)
        
        XCTAssertEqual(spies.viewControllerSpy.calledMethods,[.changeState(state: .error(error: .badRequest))])
    }
}

extension WeatherPresenterTests {
    
    struct Spies {
        let viewControllerSpy: WeatherViewControllerSpy
    }
    
    private func makeSut() -> (sut: WeatherPresenterProtocol, spies: Spies) {
        let viewControllerSpy = WeatherViewControllerSpy()
        
        let sut = WeatherPresenter()
        
        sut.viewController = viewControllerSpy
        
        addTeardownBlock { [weak viewControllerSpy, weak sut] in
            XCTAssertNil(viewControllerSpy)
            XCTAssertNil(sut)
        }
        
        let spies = Spies(
            viewControllerSpy: viewControllerSpy
        )
        
        return (sut: sut, spies: spies)
    }
}

