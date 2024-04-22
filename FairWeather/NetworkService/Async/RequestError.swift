//
//  RequestError.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

public enum RequestError: Error, LocalizedError {
    case emptyWeather
    case baseURLError
    case urlEncodingError
    case bodyEncodingError(Error)
    case internalError
    case noResponse
    case decodingError(Error)
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case http(httpResponse: HTTPURLResponse, data: Data)
    case network(URLError)
    case unknown(Error?)
}

extension RequestError: Equatable {
    public static func == (lhs: RequestError, rhs: RequestError) -> Bool {
        switch (lhs, rhs) {
        case (.emptyWeather, .emptyWeather):
            return true
        case (.baseURLError, .baseURLError):
            return true
        case (.urlEncodingError, .urlEncodingError):
            return true
        case let (.bodyEncodingError(lhsError), .bodyEncodingError(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (.internalError, .internalError):
            return true
        case (.noResponse, .noResponse):
            return true
        case let (.decodingError(lhsError), .decodingError(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (.badRequest, .badRequest):
            return true
        case (.unauthorized, .unauthorized):
            return true
        case (.forbidden, .forbidden):
            return true
        case (.notFound, .notFound):
            return true
        case let (.http(lhsHttpResponse, lhsData), .http(rhsHttpResponse, rhsData)):
            return lhsHttpResponse == rhsHttpResponse && lhsData == rhsData
        case let (.network(lhsError), .network(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case let (.unknown(lhsError), .unknown(rhsError)):
            return lhsError?.localizedDescription == rhsError?.localizedDescription
        default:
            return false







        }
    }
}
