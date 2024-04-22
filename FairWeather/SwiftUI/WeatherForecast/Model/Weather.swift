//
//  Weather.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let name: String
    let description: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id
        case name = "main"
        case description
        case icon
    }
}
