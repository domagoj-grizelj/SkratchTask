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

protocol MapRouterDelegate: AnyObject {

    func navigateToFriendDetails(user: User)
    
}

class MapRouter {
    
    weak var viewController: MapViewController?
    weak var delegate: MapRouterDelegate?

}

// MARK: - Routing Logic

extension MapRouter: MapRoutingLogic {

    func navigateToFriendDetails(user: User) {
        delegate?.navigateToFriendDetails(user: user)
    }

}
