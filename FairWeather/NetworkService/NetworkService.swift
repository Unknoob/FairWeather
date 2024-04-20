//
//  NetworkService.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

protocol NetworkService {
    func makeRequest(
        _ request: URLRequest,
        completion: @escaping (_ result: Result<Data, Error>) -> Void
    )
}
