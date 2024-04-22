//
//  Weather.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

struct Weather: Decodable, Equatable {
    let id: Int
    let name: String
    let description: String
    let icon: String

    init(
        id: Int,
        name: String,
        description: String,
        icon: String
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.icon = icon
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name = "main"
        case description
        case icon
    }
}
