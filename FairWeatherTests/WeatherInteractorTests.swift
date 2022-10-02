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
        let (sut, presenterSpy, networkSpy) = makeSut()
        
        networkSpy.mockResult = .success(JSONHelper.jsonData("4418"))
                
        sut.loadWeather()
        
        XCTAssertEqual(presenterSpy.calledMethods, [.didLoadWeather(result: .successMock)])
    }

    func testLoadWeatherEmptyError() throws {
        let (sut, presenterSpy, networkSpy) = makeSut()
        
        networkSpy.mockResult = .success(JSONHelper.jsonData("empty"))
        
        sut.loadWeather()
        
        XCTAssertEqual(presenterSpy.calledMethods, [.didLoadWeather(result: .successEmptyWeatherMock)])
    }
    
    func testLoadWeatherServerError() throws {
        let (sut, presenterSpy, networkSpy) = makeSut()
        
        networkSpy.mockResult = .failure(HTTPError.unknown)
        
        sut.loadWeather()
        
        XCTAssertEqual(presenterSpy.calledMethods, [.didLoadWeather(result: .failureServerErrorMock)])
    }
    
    private func makeSut() -> (WeatherInteractorInputProtocol, WeatherPresenterSpy, NetworkServiceSpy) {
        let presenterSpy = WeatherPresenterSpy()
        let networkServiceSpy = NetworkServiceSpy()
        let sut = WeatherInteractor(networkService: networkServiceSpy)
        sut.presenter = presenterSpy
        
//        addTeardownBlock {
//            XCTAssertNil(presenterSpy)
//            XCTAssertNil(networkServiceSpy)
//            XCTAssertNil(sut)
//        }
        
        return (sut, presenterSpy, networkServiceSpy)
    }

}
