//
//  UserDefaultsUtilSpy.swift
//  FairWeatherTests
//
//  Created by Gabriel Beltrame Silva on 22/04/24.
//

import Foundation
@testable import FairWeather

class UserDefaultsUtilSpy {
    enum Method {
        case saveObject(object: Encodable, key: UserDefaultsKey)
        case retrieveObject(key: UserDefaultsKey)
    }

    var calledMethods: [Method] = []
    var retrieveObjectMocks: [Decodable?] = []
}

extension UserDefaultsUtilSpy: UserDefaultsUtilProtocol {
    func saveObject(_ object: Encodable, key: UserDefaultsKey) {
        calledMethods.append(.saveObject(object: object, key: key))
    }

    func retrieveObject<T: Decodable>(forKey key: UserDefaultsKey) -> T? {
        calledMethods.append(.retrieveObject(key: key))

        guard !retrieveObjectMocks.isEmpty else {
            return nil
        }

        return retrieveObjectMocks.removeFirst() as? T
    }
}

extension UserDefaultsUtilSpy.Method: Equatable {
    static func == (lhs: UserDefaultsUtilSpy.Method, rhs: UserDefaultsUtilSpy.Method) -> Bool {
        switch (lhs, rhs) {
        case let (.saveObject(lhsObject, lhsKey), .saveObject(rhsObject, rhsKey)):
            let encoder = JSONEncoder()
            encoder.outputFormatting = .sortedKeys
            guard
                let lhsData = try? encoder.encode(lhsObject),
                let rhsData = try? encoder.encode(rhsObject)
            else {
                return false
            }

            return lhsData == rhsData && lhsKey == rhsKey
        case let (.retrieveObject(lhsKey), .retrieveObject(rhsKey)):
            return lhsKey == rhsKey
        default:
            return false
        }
    }
}
