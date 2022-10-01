//
//  UIFont+Extensions.swift
//  FairWeather
//
//  Created by Gabriel Beltrame Silva on 01/10/22.
//

import Foundation
import UIKit

extension UIFont {
    static var titleFont: UIFont {
        return UIFont.systemFont(ofSize: 48, weight: .bold)
    }
    
    static var descriptionFont: UIFont {
        return UIFont.systemFont(ofSize: 24, weight: .regular)
    }
    
    static var detailFont: UIFont {
        return UIFont.systemFont(ofSize: 12, weight: .thin)
    }
}
