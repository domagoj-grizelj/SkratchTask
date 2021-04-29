//
//  Assets.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 29.04.2021..
//

import UIKit

enum Assets: String {

    case kSwitchMapIcon = "map"
    case kSwitchListIcon = "list"

    var image: UIImage? {
        return UIImage(named: self.rawValue) ?? nil
    }

}
