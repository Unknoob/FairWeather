//
//  City.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

struct City: Decodable {
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
}
