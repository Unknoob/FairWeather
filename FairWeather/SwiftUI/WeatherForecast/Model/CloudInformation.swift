//
//  CloudInformation.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

struct CloudInformation: Decodable, Equatable {
    let allCloudsPercentage: Int

    init(allCloudsPercentage: Int) {
        self.allCloudsPercentage = allCloudsPercentage
    }

    enum CodingKeys: String, CodingKey {
        case allCloudsPercentage = "all"
    }
}
