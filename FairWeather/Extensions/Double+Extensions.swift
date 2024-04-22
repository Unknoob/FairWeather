//
//  Double+Extensions.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

extension Double {
    var formattedAsCelsiusTemperature: String {
        return "\(Int(self))°C"
    }
}
