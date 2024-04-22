//
//  UserDefaultsUtil.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation

protocol UserDefaultsUtilProtocol: AnyObject {
    func saveObject(_ object: Encodable, key: UserDefaultsKey)
    func retrieveObject<T: Decodable>(forKey key: UserDefaultsKey) -> T?
}

class UserDefaultsUtil: UserDefaultsUtilProtocol {
    func saveObject(_ object: Encodable, key: UserDefaultsKey) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            UserDefaults.standard.set(encoded, forKey: key.rawValue)
        }
    }

    func retrieveObject<T: Decodable>(forKey key: UserDefaultsKey) -> T? {
        guard
            let loadedData = UserDefaults.standard.object(forKey: key.rawValue) as? Data,
            let loadedObject = try? JSONDecoder().decode(T.self, from: loadedData)
        else {
            return nil
        }

        return loadedObject
    }
}

enum UserDefaultsKey: String, Equatable {
    case city
}
