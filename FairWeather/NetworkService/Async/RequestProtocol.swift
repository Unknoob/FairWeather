//
//  RequestProtocol.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

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

extension RequestProtocol {
    func buildRequest() throws -> URLRequest {
        guard var urlComponents = URLComponents(string: self.baseURL + self.endpoint) else {
            throw RequestError.baseURLError
        }

        var body: Data? = nil
        if let parameters = self.parameters {
            switch self.method {
            case .GET:
                urlComponents.queryItems = []
                parameters.forEach { (key, value) in
                    urlComponents.queryItems?.append(URLQueryItem(name: key, value: String(describing: value)))
                }
            default:
                do {
                    body = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                } catch {
                    throw RequestError.bodyEncodingError(error)
                }
            }

        }

        guard let url = urlComponents.url else {
            throw RequestError.urlEncodingError
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method.rawValue
        urlRequest.httpBody = body

        self.headers?.forEach({ (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        })

        return urlRequest
    }
}
