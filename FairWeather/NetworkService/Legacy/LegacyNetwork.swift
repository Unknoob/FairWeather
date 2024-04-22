//
//  LegacyNetwork.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation

class LegacyNetwork: LegacyNetworkService {
    let session = URLSession.shared

    func makeRequest(
        _ request: URLRequest,
        completion: @escaping (_ result: Result<Data, Error>) -> Void
    ) {
        print(request)
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            print(response as Any)

            if error != nil {
                completion(.failure(error!))
                return
            }
            guard let data = data else {
                return
            }
            completion(.success(data))
        })
        task.resume()
    }
}
