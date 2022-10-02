//
//  NetworkServiceSpy.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 02/10/22.
//

import Foundation
@testable import FairWeather

class NetworkServiceSpy {
    enum Method {
        case makeRequest(request: URLRequest)
    }
    
    var calledMethods: [Method] = []
    var mockResult: Result<Data, Error>?
}

extension NetworkServiceSpy: NetworkService {
    func makeRequest(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> ()) {
        calledMethods.append(.makeRequest(request: request))
        if let mockResult  = mockResult {
            completion(mockResult)
        }
    }
}

extension NetworkServiceSpy.Method: Equatable {
    static func == (lhs: NetworkServiceSpy.Method, rhs: NetworkServiceSpy.Method) -> Bool {
        switch (lhs, rhs) {
        case let (.makeRequest(lhsRequest), .makeRequest(rhsRequest)):
            return lhsRequest == rhsRequest
        }
    }
}
