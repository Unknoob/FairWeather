//
//  WeatherForecast.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

struct WeatherForecast: Decodable, Equatable {
    let mainInformation: MainInformation
    let date: Date
    let weatherList: [Weather]
    let windInformation: Wind
    let cloudInformation: CloudInformation

    enum CodingKeys: String, CodingKey {
        case mainInformation = "main"
        case date = "dt"
        case weatherList = "weather"
        case windInformation = "wind"
        case cloudInformation = "clouds"
    }

    init(
        mainInformation: MainInformation,
        date: Date,
        weatherList: [Weather],
        windInformation: Wind,
        cloudInformation: CloudInformation
    ) {
        self.mainInformation = mainInformation
        self.date = date
        self.weatherList = weatherList
        self.windInformation = windInformation
        self.cloudInformation = cloudInformation
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mainInformation = try container.decode(MainInformation.self, forKey: .mainInformation)

        let dateTimestamp = try container.decode(Double.self, forKey: .date)
        date = Date(timeIntervalSince1970: dateTimestamp)

        weatherList = try container.decode([Weather].self, forKey: .weatherList)
        windInformation = try container.decode(Wind.self, forKey: .windInformation)
        cloudInformation = try container.decode(CloudInformation.self, forKey: .cloudInformation)
    }
}

extension WeatherForecast {
    var iconURL: URL? {
        guard let iconName = weatherList.first?.icon else {
            return nil
        }
        return URL(string: "https://openweathermap.org/img/w/\(iconName).png")
    }
}
