//
//  LegacyNetworkService.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

protocol LegacyNetworkService {
    func makeRequest(
        _ request: URLRequest,
        completion: @escaping (_ result: Result<Data, Error>) -> Void
    )
}
