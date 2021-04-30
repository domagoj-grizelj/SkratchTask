//
//  FriendsLocale.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 29.04.2021..
//

import Foundation

enum FriendsLocale: String {

  case kNavigationTitle = "locale.friendsList.navigation.title"

  var localized: String {
    return rawValue.localized()
  }
}
