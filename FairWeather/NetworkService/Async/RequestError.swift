//
//  RequestError.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

public enum RequestError: Error, LocalizedError {
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
