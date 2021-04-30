//
//  FriendsRouter.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import Foundation

protocol FriendsRoutingLogic {

}

protocol FriendsRouterDelegate: AnyObject {

}

class FriendsRouter {

    weak var viewController: FriendsViewController?
    weak var delegate: FriendsRouterDelegate?

}

// MARK: - Routing Logic

extension FriendsRouter: FriendsRoutingLogic {

}
