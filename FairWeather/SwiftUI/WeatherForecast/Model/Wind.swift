//
//  Wind.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

struct Wind: Decodable {
    let speed: Double?
    let degrees: Double?

    init(
        speed: Double?,
        degrees: Double?
    ) {
        self.speed = speed
        self.degrees = degrees
    }

    enum CodingKeys: String, CodingKey {
        case speed
        case degrees = "deg"
    }
}
