//
//  FriendsRouter.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import Foundation

protocol FriendsRoutingLogic {

    func navigateToFriendDetails(user: User)

}

protocol FriendsRouterDelegate: AnyObject {

    func navigateToFriendDetails(user: User)

}

class FriendsRouter {

    weak var viewController: FriendsViewController?
    weak var delegate: FriendsRouterDelegate?

}

// MARK: - Routing Logic

extension FriendsRouter: FriendsRoutingLogic {

    func navigateToFriendDetails(user: User) {
        delegate?.navigateToFriendDetails(user: user)
    }

}
