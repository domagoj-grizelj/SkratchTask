//
//  PageLocale.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//

import Foundation

enum PageLocale: String {

  case kInputPlaceholder = "locale.page.input.placeholder"

  var localized: String {
    return rawValue.localized()
  }
}
