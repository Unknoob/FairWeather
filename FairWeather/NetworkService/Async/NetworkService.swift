//
//  NetworkService.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

public protocol NetworkServiceProtocol {
    func executeRequest<T: Decodable>(request: any RequestProtocol) async throws -> Result<T, RequestError>
}

class NetworkService: NetworkServiceProtocol {

    func executeRequest<T: Decodable>(request: any RequestProtocol) async throws -> Result<T, RequestError> {
        let urlRequest = try request.buildRequest()

        print("<<<<< URL Request >>>>>")
        print(urlRequest)

        let response = try await URLSession.shared.data(for: urlRequest)

        return .success(try mapResponse(response: response))
    }

    private func mapResponse<T: Decodable>(response: (data: Data, response: URLResponse)) throws -> T {
        guard let httpResponse = response.response as? HTTPURLResponse else {
            throw RequestError.noResponse
        }

        switch httpResponse.statusCode {
        case 200..<300:
            let decodedObject = try JSONDecoder().decode(T.self, from: response.data)
            return decodedObject
        case 400:
            throw RequestError.badRequest
        case 401:
            throw RequestError.unauthorized
        case 403:
            throw RequestError.forbidden
        case 404:
            throw RequestError.notFound
        default:
            throw RequestError.http(httpResponse: httpResponse, data: response.data)
        }
    }
}


