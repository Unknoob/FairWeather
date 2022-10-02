//
//  JSONHelper.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 02/10/22.
//

import Foundation

class JSONHelper {
    
    static func jsonData(_ filename: String) -> Data {
        let bundle = Bundle(for: JSONHelper.self)
        guard
            let pathURL = bundle.url(forResource: filename, withExtension: "json"),
            let data = try? Data(contentsOf: pathURL)
        else {
            fatalError("Error loading \(filename).json")
        }
        
        return data
    }
}
