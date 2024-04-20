//
//  HTTPError.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

enum HTTPError: Error, Equatable {
    case badRequest
    case notFound
    case serverError
    case unknown

    init(code: Int) {
        switch code {
        case 400:
            self = .badRequest
        case 404:
            self = .notFound
        case 500...599:
            self = .serverError
        default:
            self = .unknown
        }
    }
}
