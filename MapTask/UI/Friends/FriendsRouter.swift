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

protocol FriendsDataPassing {

    var dataStore: FriendsDataStore? { get }
}

protocol FriendsRouterDelegate: AnyObject {

}

class FriendsRouter: FriendsDataPassing {

    weak var viewController: FriendsViewController?
    weak var delegate: FriendsRouterDelegate?

    var dataStore: FriendsDataStore?

}

// MARK: - Routing Logic

extension FriendsRouter: FriendsRoutingLogic {

}
