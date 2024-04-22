//
//  CloudInformation.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

struct CloudInformation: Codable {
    let allCloudsPercentage: Int

    enum CodingKeys: String, CodingKey {
        case allCloudsPercentage = "all"
    }
}
