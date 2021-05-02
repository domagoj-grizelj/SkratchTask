//
//  MapRouter.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import Foundation

protocol MapRoutingLogic {

    func navigateToFriendDetails(user: User)
    
}

protocol MapDataPassing {

    var dataStore: MapDataStore? { get }
}

protocol MapRouterDelegate: AnyObject {

    func navigateToFriendDetails(user: User)
    
}

class MapRouter: MapDataPassing {
    
    weak var viewController: MapViewController?
    weak var delegate: MapRouterDelegate?

    var dataStore: MapDataStore?
    
}

// MARK: - Routing Logic

extension MapRouter: MapRoutingLogic {

    func navigateToFriendDetails(user: User) {
        delegate?.navigateToFriendDetails(user: user)
    }

}
