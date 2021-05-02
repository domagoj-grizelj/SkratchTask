//
//  FriendDetailsRouter.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 02.05.2021..
//  
//

import Foundation

protocol FriendDetailsRoutingLogic {
  
}

protocol FriendDetailsRouterDelegate: AnyObject {
  
}

class FriendDetailsRouter {
  weak var viewController: FriendDetailsViewController?
  weak var delegate: FriendDetailsRouterDelegate?
}

// MARK: - Routing Logic
extension FriendDetailsRouter: FriendDetailsRoutingLogic {
  
}
