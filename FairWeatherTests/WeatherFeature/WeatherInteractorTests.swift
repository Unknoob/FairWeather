//
//  WeatherInteractorTests.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 30/09/22.
//

import XCTest
@testable import FairWeather

final class WeatherInteractorTests: XCTestCase {
    
    func testLoadWeatherSuccess() throws {
        let (sut, spies) = makeSut()
        
        spies.networkServiceSpy.mockResult = .success(JSONHelper.jsonData("4418"))
        
        sut.loadWeather()
        
        XCTAssertEqual(spies.presenterSpy.calledMethods, [.didLoadWeather(result: .successMock)])
    }
    
    func testLoadWeatherEmptyError() throws {
        let (sut, spies) = makeSut()
        
        spies.networkServiceSpy.mockResult = .success(JSONHelper.jsonData("empty"))
        
        sut.loadWeather()
        
        XCTAssertEqual(spies.presenterSpy.calledMethods, [.didLoadWeather(result: .successEmptyWeatherMock)])
    }
    
    func testLoadWeatherServerError() throws {
        let (sut, spies) = makeSut()
        
        spies.networkServiceSpy.mockResult = .failure(HTTPError.unknown)
        
        sut.loadWeather()
        
        XCTAssertEqual(spies.presenterSpy.calledMethods, [.didLoadWeather(result: .failureServerErrorMock)])
    }
    
    func testShowForecastListWithoutWeatherLoaded() throws {
        let (sut, spies) = makeSut()
        
        sut.showForecastList()
        
        XCTAssert(spies.routerSpy.calledMethods.isEmpty)
    }
    
    func testShowForecastListWithWeatherLoaded() throws {
        let (sut, spies) = makeSut()
        
        spies.networkServiceSpy.mockResult = .success(JSONHelper.jsonData("4418"))
        
        sut.loadWeather()
        
        sut.showForecastList()
        
        XCTAssertEqual(spies.presenterSpy.calledMethods, [.didLoadWeather(result: .successMock)])
        
        XCTAssertEqual(spies.routerSpy.calledMethods, [.showWeatherList(weather: .mock)])
    }
}

extension WeatherInteractorTests {
    
    struct Spies {
        let presenterSpy: WeatherPresenterSpy
        let routerSpy: WeatherRouterSpy
        let networkServiceSpy: NetworkServiceSpy
    }
    
    private func makeSut() -> (sut: WeatherInteractorProtocol, spies: Spies) {
        let presenterSpy = WeatherPresenterSpy()
        let routerSpy = WeatherRouterSpy()
        let networkServiceSpy = NetworkServiceSpy()
        let sut = WeatherInteractor(
            presenter: presenterSpy,
            router: routerSpy,
            networkService: networkServiceSpy
        )
        
        addTeardownBlock { [weak presenterSpy, weak routerSpy, weak networkServiceSpy, weak sut] in
            XCTAssertNil(presenterSpy)
            XCTAssertNil(routerSpy)
            XCTAssertNil(networkServiceSpy)
            XCTAssertNil(sut)
        }
        
        let spies = Spies(
            presenterSpy: presenterSpy,
            routerSpy: routerSpy,
            networkServiceSpy: networkServiceSpy
        )
        
        return (sut: sut, spies: spies)
    }
}
