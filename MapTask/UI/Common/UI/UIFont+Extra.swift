//
//  UIFont+Extra.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//

import UIKit

public enum FontStyle: String {

    static let fontFamilyName = "circularstd"

    case standard = "book"

    var name: String {
        switch self {
        case .standard: return "\(FontStyle.fontFamilyName)-\(rawValue)"
        }
    }

}

extension UIFont {

    static func custom(type: FontStyle, size: CGFloat) -> UIFont {
        return UIFont(name: type.name, size: size) ?? .systemFont(ofSize: size)
    }

}
