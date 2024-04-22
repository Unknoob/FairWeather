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
        
        spies.networkServiceSpy.mockResult = .success(JSONHelper.jsonData("weather"))
        spies.userDefaultsUtilSpy.retrieveObjectMocks = [City.defaultCity]
        
        sut.loadWeather()
        
        XCTAssertEqual(
            spies.presenterSpy.calledMethods,
            [
                .showLoading,
                .didLoadWeather(result: .successMock, city: City.defaultCity)
            ]
        )
    }
    
    func testLoadWeatherEmptyError() throws {
        let (sut, spies) = makeSut()
        
        spies.networkServiceSpy.mockResult = .success(JSONHelper.jsonData("empty"))
        spies.userDefaultsUtilSpy.retrieveObjectMocks = [City.defaultCity]
        
        sut.loadWeather()
        
        XCTAssertEqual(
            spies.presenterSpy.calledMethods,
            [
                .showLoading,
                .didLoadWeather(result: .successEmptyWeatherMock, city: City.defaultCity)
            ]
        )
    }
    
    func testLoadWeatherServerError() throws {
        let (sut, spies) = makeSut()
        
        spies.networkServiceSpy.mockResult = .failure(HTTPError.badRequest)
        spies.userDefaultsUtilSpy.retrieveObjectMocks = [City.defaultCity]
        
        sut.loadWeather()
        
        XCTAssertEqual(
            spies.presenterSpy.calledMethods,
            [
                .showLoading,
                .didLoadWeather(result: .failureServerErrorMock, city: City.defaultCity)
            ]
        )
    }
    
    func testShowForecastListWithoutCitySaved() throws {
        let (sut, spies) = makeSut()
        
        sut.showForecastList()
        
        XCTAssertEqual(spies.routerSpy.calledMethods, [.showWeatherForecast(city: City.defaultCity)])
    }
    
    func testShowForecastListWithCitySaved() throws {
        let (sut, spies) = makeSut()

        spies.userDefaultsUtilSpy.retrieveObjectMocks = [City.rio]
        
        sut.showForecastList()
        
        XCTAssertEqual(spies.routerSpy.calledMethods, [.showWeatherForecast(city: City.rio)])
    }

    func testShowCitySearch() throws {
        let (sut, spies) = makeSut()

        sut.showCitySearch()

        XCTAssertEqual(spies.routerSpy.calledMethods, [.showCitySearch])
    }
}

extension WeatherInteractorTests {
    
    struct Spies {
        let presenterSpy: WeatherPresenterSpy
        let routerSpy: WeatherRouterSpy
        let networkServiceSpy: NetworkServiceSpy
        let userDefaultsUtilSpy: UserDefaultsUtilSpy
    }
    
    private func makeSut() -> (sut: WeatherInteractorProtocol, spies: Spies) {
        let presenterSpy = WeatherPresenterSpy()
        let routerSpy = WeatherRouterSpy()
        let networkServiceSpy = NetworkServiceSpy()
        let userDefaultsUtilSpy = UserDefaultsUtilSpy()
        let sut = WeatherInteractor(
            presenter: presenterSpy,
            router: routerSpy,
            networkService: networkServiceSpy,
            userDefaultsUtil: userDefaultsUtilSpy
        )
        
        addTeardownBlock { [
            weak presenterSpy, weak routerSpy, weak networkServiceSpy, weak userDefaultsUtilSpy, weak sut
        ] in
            XCTAssertNil(presenterSpy)
            XCTAssertNil(routerSpy)
            XCTAssertNil(networkServiceSpy)
            XCTAssertNil(userDefaultsUtilSpy)
            XCTAssertNil(sut)
        }
        
        let spies = Spies(
            presenterSpy: presenterSpy,
            routerSpy: routerSpy,
            networkServiceSpy: networkServiceSpy,
            userDefaultsUtilSpy: userDefaultsUtilSpy
        )
        
        return (sut: sut, spies: spies)
    }
}
