//
//  City.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

struct City: Codable, Equatable {
    let name: String
    let lat: Double
    let lon: Double
    let state: String?
    let country: String

    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case lat
        case lon
        case country
        case state
    }

    enum LocalNamesCodingKeys: String, CodingKey {
        case portuguese = "pt"
    }

    public init(
        name: String,
        lat: Double,
        lon: Double,
        state: String?,
        country: String
    ) {
        self.name = name
        self.lat = lat
        self.lon = lon
        self.state = state
        self.country = country
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let namesContainer = try? container.nestedContainer(keyedBy: LocalNamesCodingKeys.self, forKey: .localNames) {
            name = try namesContainer.decode(String.self, forKey: .portuguese)
        } else {
            name = try container.decode(String.self, forKey: .name)
        }
        lat = try container.decode(Double.self, forKey: .lat)
        lon = try container.decode(Double.self, forKey: .lon)
        state = try? container.decode(String.self, forKey: .state)
        country = try container.decode(String.self, forKey: .country)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(lon, forKey: .lon)
        try container.encode(lat, forKey: .lat)
        try container.encode(lon, forKey: .lon)
        try container.encode(state, forKey: .state)
        try container.encode(country, forKey: .country)
    }
}

extension City {
    static let defaultCity = City(name: "São Paulo", lat: -23.533773, lon: -46.625290, state: "SP", country: "BR")
}
