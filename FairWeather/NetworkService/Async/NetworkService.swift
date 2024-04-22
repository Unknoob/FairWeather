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
        guard var urlComponents = URLComponents(string: request.baseURL + request.endpoint) else {
            return .failure(.internalError)
        }

        var body: Data? = nil
        if let parameters = request.parameters {
            switch request.method {
            case .GET:
                urlComponents.queryItems = []
                parameters.forEach { (key, value) in
                    urlComponents.queryItems?.append(URLQueryItem(name: key, value: String(describing: value)))
                }
            default:
                body = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            }

        }

        guard let url = urlComponents.url else {
            return .failure(.internalError)
        }

        var urlRequest = URLRequest(url: url)

        print("<<<<< URL Request >>>>>")
        print(urlRequest)

        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = body

        request.headers?.forEach({ (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        })

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

public enum RequestMethods: String {
    case GET
    case POST
    case DELETE
    case PUT
    case PATCH
}

public protocol RequestProtocol: Equatable {
    var baseURL: String { get }
    var endpoint: String { get }
    var method: RequestMethods { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}

extension RequestProtocol {
    var defaultParameters: [String: Any]? {
        return [
            "appid": "ff6b54a517d06c49b53b82fb6bd994bf"
        ]
    }
}
