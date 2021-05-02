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
    case kFriendCountCheckmark = "tickSmall"
    case kBalloonIcon = "balloonIcon"
    case kPinIcon = "pinIcon"
    case kPhoneIcon = "phoneIcon"
    case kEmailIcon = "emailIcon"

    var image: UIImage? {
        return UIImage(named: self.rawValue) ?? nil
    }

}
