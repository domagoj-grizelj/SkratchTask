//
//  FriendDetailsLocale.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 03.05.2021..
//

import Foundation

import Foundation

enum FriendDetailsLocale: String {

  case kRegistrationLabel = "locale.friend.footer.registration"

  var localized: String {
    return rawValue.localized()
  }
}
