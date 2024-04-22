//
//  Wind.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

struct Wind: Codable {
    let speed: Double?
    let degrees: Double?

    enum CodingKeys: String, CodingKey {
        case speed
        case degrees = "deg"
    }
}
